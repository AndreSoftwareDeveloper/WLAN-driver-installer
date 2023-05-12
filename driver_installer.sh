if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
dnf install kernel-headers kernel-devel
dnf group install "C Development Tools and Libraries"
git clone https://github.com/lwfinger/rtw89.git
cd rtw89/
make
make install

read -p "The computer must be restarted for the changes to take effect. Would You like to restart now? (y/N): " answer
if [[ $answer =~ ^[Yy]$ ]]; then
    reboot
fi
