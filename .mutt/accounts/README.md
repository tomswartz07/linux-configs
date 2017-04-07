# Setting Up Mutt Accounts

In order to utilize the multi-account setup for Mutt, simply create a 'header'
file for the master `.muttrc`.

Contained in this file should be, at minimum:

```
set imap_user="EMAIL ADDRESS"
set from="EMAIL ADDRESS"
set hostname="HOSTNAME OF EMAIL PROVIDER"
set sendmail="/usr/bin/msmtp -a <MSMTP ACCOUNT NAME>"
set header_cache="~/.mutt/headercache-<MSMTP ACCOUNT NAME>"
set folder=imaps://imap.gmail.com/
set spoolfile=+INBOX
mailboxes =INBOX
set record=+"[Gmail]/Sent Mail"
#fcc-hook ~A ="[Gmail]/Sent Mail"

# Securely source the password file
source "gpg --textmode -d ~/.mutt/password-<MSMTP ACCOUNT NAME>.gpg |"
```

Optionally, you can include any account-specific macros, settings, or
colorscheme options that you wish.

## Secure Password Sourcing
In order to securely store the password on the drive, gpg can encrypt the
password file at rest, and Mutt will decode it at runtime.
Simply create a file containing the following

```
set imap_pass="PASSWORD"
```

and encrypt it with gpg.
