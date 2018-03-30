#!/bin/sh
# complete installation of labjack-python support for mac osx

wget --no-check-certificate https://labjack.com/sites/default/files/software/Exodriver_NativeUSB_Setup.zip
unzip -l Exodriver_NativeUSB_Setup.zip
unzip Exodriver_NativeUSB_Setup.zip
open Exodriver_NativeUSB_Setup.pkg
  
git clone https://github.com/labjack/LabJackPython.git
cd LabJackPython
python ./setup.py install
cd ..

rm -rf LabJackPython Exodriver_NativeUSB_Setup.* __MACOSX

cat <<EOF

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Labjack drivers installed - root and group:${LJGROUP} have access.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

EOF
