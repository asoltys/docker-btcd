FROM phusion/baseimage
RUN apt-get update
RUN apt-get install build-essential wget git mercurial -yqq
RUN wget http://golang.org/dl/go1.3.src.tar.gz
RUN tar xfz go1.3.src.tar.gz
RUN cd go/src && ./make.bash
ENV GOPATH /root/go
ENV GOROOT /go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
RUN git config --global url.git://github.com/.insteadOf https://github.com/
RUN go get github.com/conformal/btcd/...
ADD btcd.conf /root/.btcd/btcd.conf
ADD btcctl.conf /root/.btcd/btcctl.conf
ADD controller.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/controller.sh
VOLUME ["/root/.btcd"]
EXPOSE 8333 8334
ENTRYPOINT ["/usr/local/bin/controller.sh"]
CMD ["btcd"]
