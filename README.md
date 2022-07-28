# GeckoDriver Autoinstaller Shell Script

> GeckoDriver Autoinstaller Shell Script is a shell script made to automate the installation process for GeckoDriver on Linux and MacOS. It installs the binary at `/usr/local/bin` to be globally available for the system.

---

### How to:

1.  Clone this repository or download the latest release <a href="https://github.com/NepZR/geckodriver-sh-installer/releases">here</a>.
    ```bash
    $ git clone https://github.com/NepZR/geckodriver-sh-installer.git
    ```
2.  Access the repository folder:
    ```bash
    $ cd geckodriver-sh-installer
    ```
3.  Make the shell script executable:
    ```bash
    $ sudo chmod +x geckodriver_installer.sh
    ```
4.  Run the script with sudo:
    ```bash
    $ sudo ./geckodriver_installer -h
    ```

---

### Usage:

```bash
$ sudo ./geckodriver_installer.sh [-h | --help] [-v | --version] [-a | --arch arch_name] [-t | --tag tag_number]
```

### Help command (-h | --help):

```
Geckodriver Autoinstaller's Help Guide
    --tag | -t     :: Set the release tag number for the desired version of geckodriver. See: https://github.com/mozilla/geckodriver/releases.
    --arch | -a    :: Set the architeture/platform version of geckodriver. The current supported versions are: linux32, linux64, macos, macos-aarch64.
    --version | -v :: Prints the current version of this shell script.
```

### Parameters:

-   `-t` | `--tag` :: Used to set the release tag number to be installed on the system. Use the versions available <a href="https://github.com/mozilla/geckodriver/releases">here</a> as a value for this parameter.
-   `-a` | `--arch` :: Used to set the geckodriver architeture / platform version to be installed on the system. The current supported arch values are: `linux32`, `linux64`, `macos`, `macos-aarch64`.

---

### Example usage:

```bash
$ sudo ./geckodriver_installer.sh --arch linux64 --tag 0.31.0
```

#### _This will install the geckodriver binary version 0.31.0 for Linux x86_64 (linux64)._
