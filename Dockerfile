FROM ubuntu:latest AS base
RUN apt update
RUN apt install xorg lxde-core tightvncserver firefox python3 python3-pip wget curl -y
RUN apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt autoremove -y
# cretae config
ENV USER=root
RUN mkdir -p ~/.vnc && \
    echo "secret" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd && \
    tightvncserver :1
RUN tightvncserver -kill :1
RUN echo "#!/bin/sh\n\
xrdb $HOME/.Xresources\n\
startlxde &\n\
lxterminal &\n\
/usr/bin/lxsession -s LXDE &\n\
~/.vnc/xstartup" > ~/.vnc/xstartup && \
    chmod +x ~/.vnc/xstartup

# switch this depending on arch
RUN wget -q "https://github.com/mozilla/geckodriver/releases/download/v0.35.0/geckodriver-v0.35.0-linux64.tar.gz" \
    -O /tmp/geckodriver.tar.gz && \
    tar -xzf /tmp/geckodriver.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/geckodriver && \
    rm /tmp/geckodriver.tar.gz

ENTRYPOINT [ "tightvncserver", ":1" ]