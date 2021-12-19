#!/bin/bash

# ensure all updates are done

apt update  -y

apt full-update -y

apt  autoremove --purge  -y
