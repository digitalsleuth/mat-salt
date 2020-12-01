# mat-salt
MAT Salt States

This is MAT, the Mobile Analysis Toolkit. 

This repo contains state files for use with SaltStack, which will allow you to install the tools using salt-call.
The purpose of these states is to install several forensic applications for conducting Mobile Forensics.

A CLI will soon follow, allowing these states to be installed automatically. These states are configured for use with
salt-minion 3001.

For the time being, if you're looking to install these manually, you can run the following:

`sudo salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls mat.(dedicated|addon) pillar='{"mat_user": "<username>"}'`

Where (dedicated|addon) is a choice between the two options, and <username> is the user for which you'd like the states/environment configured.
