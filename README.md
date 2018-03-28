# "pure python" multithreaded sampling with LabJack U3

This is a simple multithreaded module that can talk to a LabJack U3
USB device using LabJack's supplied tools to do continuous analog
sampling and digital I/O sync'd to the host computer's clock (to
within 1 ms precision).

*Only tested under Linux!* Timing measuresment validated against a
Measurement Computing PCIe-DAS1062/16 using `comedi`.

To setup and use you should run the lj-python-setup.sh script to
install current versions of the LabJack drivers. This is a fully
automated script that needs to be run as root:

    % sudo sh ./lj-python-setup.sh

Once the drivers are installed, you can do:

    % sudo python ./labjack.py

to test the setup -- this will sample for a few secs and dump
the data to stdout.




