# "pure python" multithreaded sampling with LabJack U3

This is a simple multithreaded module that can talk to a LabJack U3
USB device using LabJack's supplied tools to do continuous analog
sampling and digital I/O sync'd to the host computer's clock (to
within 1 ms precision).

Tested under Linux (Mint 18.2) and OSX (10.12.6 Sierra). Timing
measurements validated against a Measurement Computing PCIe-DAS1062/16
sing `comedi` under linux (only).

To setup and use you should run either {mac,linux}=lj-python-setup.sh
script to install current versions of the LabJack drivers if they're not
already installed. These are fully automated scripts that needs to be
run as root:

    % sudo sh ./lj-python-setup.sh

Once the drivers are installed, you can do:

    % sudo python ./labjack.py

to test the setup -- this will sample for a few secs and dump
the data to stdout.

If you're using this -- it's not a bad idea to sample for 10ms or as
soon as the labjack module is imported to initialize all the
code. Otherwise, it looks like you can get some lag the first time
the acquisition is started. I'm pretty sure this has something to do
with delayed loading of `librt` by `ctypes` in the monotonic clock
function. This problem could be gone, but not worth testing right
now.


