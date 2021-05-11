FROM debian
RUN apt update && apt install -y xinetd vim curl procps telnet
COPY dummychk /dummychk
COPY xinetd-dummychk /etc/xinetd.d/dummychk
RUN chmod 744 /dummychk && chown nobody /dummychk
RUN echo 'dummychk 9200/tcp' >> /etc/services
ENTRYPOINT xinetd -dontfork -stayalive
