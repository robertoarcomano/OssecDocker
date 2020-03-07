#!/bin/bash
# 0. Constants
REPO=OssecDocker

# 1. Download Repository
git clone https://github.com/robertoarcomano/$REPO.git /tmp/$REPO
cd /tmp/$REPO

# 2. Build Image ossec
docker build . -t ossec

# 3. Create container
docker rm -f ossec
docker create -p 81:80 --name "ossec" ossec

# 4. Launch container
docker start ossec

# 5. Delete /tmp/$REPO
cd
rm -rf /tmp/$REPO

