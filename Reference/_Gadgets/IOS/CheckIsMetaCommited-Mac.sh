#!/bin/bash

echo "start connect to SVN server ..."
pushd /Users/niko/Desktop/AresTool/Tool/_Gadgets
python CheckIsMetaCommited-Mac.py

echo "End meta file check ..."
popd

