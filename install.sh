# install bc
if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        ubuntu|debian)
            echo "Ubuntu/Debian..."
            apt install -y bc
            ;;
        fedora|centos|rhel)
            echo "Fedora/RedHat..."
            yum install bc
            ;;
        arch)
            echo "Arch..."
            pacman -Sy bc
            ;;
        *)
            echo "Unsupported distribution: $ID"
            ;;
    esac
else
    echo "Could not find /etc/os-release"
fi

# move bin to /bin/bash
for file in "./bin"/*; do
    pfile=${file:6}
    echo "Loading command $pfile"
    cp $file /bin/
    chmod +x /bin/$pfile
done

# echo done
echo "All commands loaded. Use 'bbc <base_from> <base_to> <number>' or any of the following aliases:"
echo "b2d, b2h, h2d, h2b, d2b, d2h"
