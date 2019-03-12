# tpm2

A C static library used by the tpm go package.

To compile this library, you require the tpm2-tss library.
**Fedora Users can install this with dnf**, otherwise you will need to compile it from source.

**Unless you want to run everything as root...** (which is a terrible idea), you will want to configure a udev rule to change the owner of the tpm device file to a group of your choosing, then add your user to that group. You can then use the tpm device without needing root.
