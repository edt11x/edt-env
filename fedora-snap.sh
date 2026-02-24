#!/bin/bash

is_qubes_template() {
    # Check if the qubesdb-read command exists (indicates a Qubes VM)
    if command -v qubesdb-read &> /dev/null; then
        # Read the VM type from the Qubes database
        # Type 1 typically means TemplateVM
        VM_TYPE=$(qubesdb-read /qubes-vm-type 2>/dev/null)

        # Check if the type is exactly '1'
        if [[ "$VM_TYPE" == "1" ]]; then
            return 0 # Success (is a template)
        fi
    fi

    return 1 # Failure (is not a template or not a Qubes VM)
}

echo "=================================================="
echo "Trying snap"
echo "=================================================="
if is_qubes_template
then
    sudo dnf install -y snapd qubes-snapd-helper
fi
sudo snap install grafana || true
sudo snap refresh || true

