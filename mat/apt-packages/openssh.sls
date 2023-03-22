# Name: OpenSSH
# Website: https://www.openssh.com
# Description: Initiate and receive SSH and SFTP connections.
# Category: Network Requirements
# Author: https://github.com/openssh/openssh-portable/blob/master/CREDITS
# License: BSD licence: https://github.com/openssh/openssh-portable/blob/master/LICENCE
# Version: 8.9p1
# Notes: sftp, ssh, sshd <start|stop|status>, etc.

openssh-client:
  pkg.installed

openssh-server:
  pkg.installed
