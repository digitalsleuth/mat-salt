# MAT - Mobile Analysis Toolkit
MAT Salt States

This is the backbone of MAT, the Mobile Analysis Toolkit. 

This repo contains state files for use with SaltStack, which will allow you to install the tools using salt-call.
The purpose of these states is to install several forensic applications for conducting Mobile Forensics.

The CLI can be found at https://github.com/digitalsleuth/mat-cli and will allow these states to be installed automatically. These states are configured for use with
SaltStack v3005.

However, if you're looking to install these manually, you can run the following:

`sudo salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls mat.(dedicated|addon) pillar='{"mat_user": "<username>"}'`

Where (dedicated|addon) is a choice between the two options, and `<username>` is the user for which you'd like the states/environment configured.
