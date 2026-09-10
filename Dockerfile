FROM ubuntu:22.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl git python3 python3-pip neofetch bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO /bin/ttyd \
    https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

RUN echo 'neofetch' >> /root/.bashrc && \
    echo 'cd /root' >> /root/.bashrc

EXPOSE 10000

CMD ["/bin/bash", "-c", "ttyd -p ${PORT:-10000} -W /bin/bash"]
