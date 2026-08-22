# Kosmos — Installation Guide

This guide explains how to install NixOS using the configuration provided by the Kosmos repository.

> **Alpha / Pre-release:** Kosmos has a stable base, but many components are still experimental. Configuration and behavior may change as the project develops. **Use it at your own risk.**

## Requirements

You will need:

- A NixOS installation/live environment
- An internet connection
- A properly partitioned and formatted disk

The commands used in this guide are standard NixOS commands.

**Main reference:** [NixOS Installation Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)

**NixOS Packages:** [Git](https://search.nixos.org/packages?channel=26.05&query=git#show=git)

---

## 1. Get Git

If `git` is not available in the current environment, start a temporary shell with Git:

```bash
nix-shell -p git
```

## 2. Partition and format the disk

Follow the standard NixOS installation guide to partition and format your disk.

For the examples below, we assume:

- `/dev/sda1` → `/boot`
- `/dev/sda2` → `/`

After formatting, mount the root partition:

```bash
mount /dev/sda2 /mnt
```

Create the boot mount point:

```bash
mkdir -p /mnt/boot
```

Mount the boot/EFI partition:

```bash
mount /dev/sda1 /mnt/boot
```

> Replace `/dev/sda1` and `/dev/sda2` with the partitions appropriate for your system.

## 3. Generate the NixOS configuration

Generate the initial NixOS configuration:

```bash
sudo nixos-generate-config --root /mnt
```

This generates the hardware-specific configuration under `/mnt/etc/nixos/`.

Remove the generated `configuration.nix`:

```bash
sudo rm /mnt/etc/nixos/configuration.nix
```

Keep `hardware-configuration.nix`, as this file is generated specifically for the hardware of the system being installed.

## 4. Clone Kosmos

Clone the repository:

```bash
git clone https://github.com/herr-ravianu/kosmos.git
```

Enter the repository:

```bash
cd kosmos
```

## 5. Copy the configuration

Copy the Kosmos configuration into the NixOS configuration directory:

```bash
cp -r . /mnt/etc/nixos/
```

The resulting structure should look similar to:

```text
/mnt/etc/nixos/
├── configuration.nix
├── hardware-configuration.nix
├── INSTALL.md
├── system
│   ├── meta.nix
│   ├── network.nix
│   ├── pkg.nix
│   └── services.nix
└── users
    └── alice.nix
```

### User configuration

The `users/` directory contains individual user configurations.

`alice.nix` is included as an example:

```text
users/
└── alice.nix
```

To add another user, create a new file using their username:

```text
users/<username>.nix
```

For example:

```text
users/bob.nix
```

The main `configuration.nix` automatically imports `.nix` files from the `users/` directory, so new user configuration files do not need to be manually added to the `imports` list.

## 6. Check the configuration

Verify that the configuration files are present:

```bash
ls -la /mnt/etc/nixos
```

Perform a dry build before installing:

```bash
nixos-rebuild dry-build --root /mnt
```

If the configuration builds successfully, proceed with the installation.

> Because Kosmos is still in alpha, a successful dry build confirms that the current configuration can be evaluated and built; it does not guarantee that every experimental component will behave as expected after installation.

## 7. Install NixOS

Run:

```bash
nixos-install --root /mnt
```

Follow the instructions provided by the installer.

Once the installation has completed, reboot:

```bash
reboot
```

Remove the installation media before the system boots again.

## Alpha Notice

Kosmos is currently an **alpha / pre-release** project.

The base configuration is considered stable enough for continued development and testing, but many components are experimental. Updates may introduce configuration changes, new defaults, or breaking changes.

Before deploying an updated version to an important system, review the repository changes and test the configuration where practical.

## References

- [NixOS Installation Guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)
- [NixOS Packages — Git](https://search.nixos.org/packages?channel=26.05&query=git#show=git)
- [Kosmos Repository](https://github.com/herr-ravianu/kosmos)
