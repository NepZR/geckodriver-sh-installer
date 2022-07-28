#!/usr/bin/env bash

# Script to automate the Geckodriver installation on Linux or Mac Systems.
# Author: Lucas D. F. Rodrigues

self_test() {
    if [ -z "$TAG_NUMBER" ]; then
        echo "No release tag number has been set, use --help | -h to see how to define this parameter.";
        exit 1
    fi

    if [ -z "$PLATFORM" ]; then
        echo "No arch/platform has been set, use --help | -h to see how to define this parameter.";
        exit 1
    fi

    if [ $PLATFORM -ne "linux32" ] && [ $PLATFORM -ne "linux64" ] && [ $PLATFORM -ne "macos" ] && [ $PLATFORM -ne "macos-aarch64" ]; then
        echo "Arch '$PLATFORM' is not supported, use --help | -h to see the valid architetures supported.";
        exit 1
    fi

    clear
}

if [ $# -eq 0 ]; then
    echo "No parameters have been specified, use --help | -h to see the valid parameters. Usage:\n    sudo ./geckodriver_installer.sh [-h | --help] [-v | --version] [-a | --arch arch_name] [-t | --tag tag_number]";
    exit 1
fi

print_header() {
    echo "|-------------------------------------------------------------------------------------------|"
    echo "|             GeckoDriver Autoinstaller Shell Script by Lucas Rodrigues (@NepZR)            |"
    echo "|----------------------------  Version 0.1.0 - July 28th, 2022  ----------------------------|"
    echo "|-------------------------------------------------------------------------------------------|"
    echo ""
}

POSITIONAL_ARGS=()

while [ $# -gt 0 ]; do
    case "$1" in
        --tag | -t) 
            TAG_NUMBER="$2"
            shift
            shift
            ;;
        --arch | -a)
            PLATFORM="$2"
            shift
            shift
            ;;
        --version | -v)
            echo "GeckoDriver Autoinstaller Shell Script - Version 0.1.0 by Lucas Rodrigues (@NepZR). License: GNU GPLv3."
            exit 1
            ;;
        --help | -h)
            echo "Geckodriver Autoinstaller's Help Guide"
            echo "    --tag | -t :: Set the release tag number for the desired version of geckodriver. See: https://github.com/mozilla/geckodriver/releases".
            echo "    --arch | -a :: Set the architeture/platform version of geckodriver. The current supported versions are: linux32, linux64, macos, macos-aarch64."
            echo "    --version | -v :: Prints the current version of this shell script."
            exit 1
            ;;
        -*|--*) 
            echo "$0: Parameter '$1' invalid, use --help | -h to see the valid parameters. Usage:\n    sudo ./geckodriver_installer.sh [-h | --help] [-v | --version] [-a | --arch arch_name] [-t | --tag tag_number]";
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=("$1")
            shift
    esac
done

set -- "${POSITIONAL_ARGS[@]}"

self_test
print_header
echo "Starting automated installation process for arch '$PLATFORM' and geckodriver '$TAG_NUMBER'..."
sleep 3

clear
wget "https://github.com/mozilla/geckodriver/releases/download/v${TAG_NUMBER}/geckodriver-v${TAG_NUMBER}-$PLATFORM.tar.gz"
sudo tar -xvf "geckodriver-v${TAG_NUMBER}-$PLATFORM.tar.gz"
rm "geckodriver-v${TAG_NUMBER}-$PLATFORM.tar.gz"
clear

if [ -e /usr/local/bin/geckodriver ]; then
    echo "A previous version of geckodriver has been found. Removing before installation of the new version."
    sudo rm /usr/local/bin/geckodriver
    sleep 3
else
    echo "A previous version of geckodriver has not been found. Procedding with the installation."
    sleep 5
fi
    sudo mv geckodriver /usr/local/bin/
    sudo chmod +x /usr/local/bin/geckodriver

clear
print_header
echo "Running geckodriver to ensure the installation has been sucessful."
sleep 2
geckodriver --version

echo ""
echo "Thanks for using this script! Have a nice day."
echo "|-------------------------------------------------------------------------------------------|"