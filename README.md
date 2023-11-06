# overly.sh

A small script to save your SSD based on OverlayFS.
Moves browser profile and browser cache to /tmp

## Why?

Yes, there is a `profile-sync-daemon`, but it often breaks the profile and is unstable (how, if it's just a bash script?).
This little script was created for that reason.

## Install

```bash
git clone https://github.com/LexSerest/overly.sh
cd overly.sh
make install
```

### Config

To change folders, use `/usr/share/overly/config.conf`.

Uses folders by default:\
Profile: `$HOME/.config/google-chrome`.\
Cache: `$HOME/.cache/google-chrome`.

### Run

```bash
systemctl --user enable overly
systemctl --user start overly

# for automatic synchronization once per hour
systemctl --user enable overly-sync
```

### Usage

Synchronization is performed automatically when the computer is turned off.

Get information on mounted folders and how much memory is used in /tmp:
`overly info`

Synchronize folders:
`overly sync`

Mount folders:
`overly mount`

Umount folders:
`overly umount`

## Unistall

```bash
make unistall
```
