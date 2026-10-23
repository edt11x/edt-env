#!/usr/bin/env bash
# Unit tests for the Debian 20.04 package gate in debian-template.sh.
set -euo pipefail

ROOT=$(cd "$(dirname "$0")" && pwd)
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

cat > "$TMPDIR/dpkg" << 'EOF'
#!/usr/bin/env bash
# Minimal stand-in for: dpkg --compare-versions VER OP VER
if [[ "${1:-}" != "--compare-versions" || $# -ne 4 ]]; then
    echo "unexpected dpkg args: $*" >&2
    exit 2
fi
left=$2
op=$3
right=$4

if [[ "$left" == "$right" ]]; then
    case "$op" in
        eq|le|ge) exit 0 ;;
        *) exit 1 ;;
    esac
fi

first=$(printf '%s\n%s\n' "$left" "$right" | sort -V | head -n1)
if [[ "$first" == "$left" ]]; then
    case "$op" in
        lt|le|ne) exit 0 ;;
        *) exit 1 ;;
    esac
fi
case "$op" in
    gt|ge|ne) exit 0 ;;
    *) exit 1 ;;
esac
EOF
chmod +x "$TMPDIR/dpkg"
export PATH="$TMPDIR:$PATH"

# Load the predicate without executing the provisioner.
eval "$(awk '/^install_post_2004_packages\(\)/,/^}$/' "$ROOT/debian-template.sh")"

failures=0

expect_install() {
    local ver=$1
    if install_post_2004_packages "$ver"; then
        echo "ok   install [$ver]"
    else
        echo "FAIL expected install for [$ver]" >&2
        failures=$((failures + 1))
    fi
}

expect_skip() {
    local ver=$1
    if install_post_2004_packages "$ver"; then
        echo "FAIL expected skip for [$ver]" >&2
        failures=$((failures + 1))
    else
        echo "ok   skip    [$ver]"
    fi
}

expect_skip "20.04"
expect_skip "18.04"
expect_skip "16.04"
expect_skip "10"
expect_skip "9"

expect_install ""
expect_install "11"
expect_install "12"
expect_install "13"
expect_install "22.04"
expect_install "24.04"
expect_install "26.04"

version_out=$(bash "$ROOT/debian-template.sh" --version)
if [[ "$version_out" == "debian-template.sh 0.1.0" ]]; then
    echo "ok   --version"
else
    echo "FAIL --version printed: $version_out" >&2
    failures=$((failures + 1))
fi

short_version_out=$(bash "$ROOT/debian-template.sh" -V)
if [[ "$short_version_out" == "debian-template.sh 0.1.0" ]]; then
    echo "ok   -V"
else
    echo "FAIL -V printed: $short_version_out" >&2
    failures=$((failures + 1))
fi

help_out=$(bash "$ROOT/debian-template.sh" --help)
if [[ "$help_out" == *"debian-template.sh 0.1.0"* && "$help_out" == *"-V"* && "$help_out" == *"--version"* ]]; then
    echo "ok   --help"
else
    echo "FAIL --help printed: $help_out" >&2
    failures=$((failures + 1))
fi

if [[ "$failures" -ne 0 ]]; then
    echo "$failures test(s) failed" >&2
    exit 1
fi

echo "All debian-template tests passed."
