export EDITOR=vim
alias vt4xx_builder='docker run -it --rm -u 1000:1000 -v /home/yellow/work/vt410:/home/build/vt410 -v /home/yellow/work/vt400:/home/build/vt400 --name vt4xx --privileged -v /dev/bus/usb:/dev/bus/usb  cybertanyellow/build-vt400 '
