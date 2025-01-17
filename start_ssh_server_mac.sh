#!/bin/bash

#Start local SSH server
/usr/libexec/sshd-keygen-wrapper
/usr/sbin/sshd -D -p 2222