FROM lscr.io/linuxserver/webtop:ubuntu-xfce

RUN apt-get update && \
    apt-get install -y flatpak gdebi-core wget && \
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
    wget -O /tmp/sunshine.deb https://github.com/LizardByte/Sunshine/releases/latest/download/sunshine-ubuntu-24.04-amd64.deb && \
    gdebi -n /tmp/sunshine.deb && \
    rm -f /tmp/sunshine.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /etc/s6-overlay/s6-rc.d/sunshine && \
    echo "#!/usr/bin/with-contenv bash" > /etc/s6-overlay/s6-rc.d/sunshine/run && \
    echo "exec /usr/bin/sunshine" >> /etc/s6-overlay/s6-rc.d/sunshine/run && \
    chmod +x /etc/s6-overlay/s6-rc.d/sunshine/run && \
    echo "longrun" > /etc/s6-overlay/s6-rc.d/sunshine/type && \
    touch /etc/s6-overlay/s6-rc.d/user/contents.d/sunshine
