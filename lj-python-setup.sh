#!/bin/sh
# complete installation of labjack-python support for linux

# be default adm group gets access to labjack -- if you want
# a different group, set it here:
LJGROUP=mlab

if [ `whoami` != root ]; then
    echo "run as root!"
    exit 1
fi

apt-get install libudev-dev libusb-1.0.0-dev

wget https://labjack.com/sites/default/files/software/exodriver-master.zip
unzip exodriver-master
cd exodriver-master
sed -i 's/adm/${LJGROUP}/g' 10-labjack.rules
sed -i 's/adm/${LJGROUP}/g' install
sh ./install.sh
cd ..

git clone https://github.com/labjack/LabJackPython.git
cd LabJackPython
python ./setup.py install
cd ..

rm -rf LabJackPython
rm -rf exodriver-master.zip exodriver-master

cat <<EOF

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Labjack drivers installed - root and group:${LJGROUP} have access.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

EOF
