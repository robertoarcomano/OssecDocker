#!/bin/bash
VER="3.1.0"
wget -qO- https://github.com/ossec/ossec-hids/archive/$VER.tar.gz | tar zx
cd ossec-hids-$VER

