FROM centos:centos7

LABEL maintainer="ponce.ballesteros@gmail.com"

ENV GENERATOR_HOME=/opt/generator \
    PATH=$GENERATOR_HOME:$PATH
    
WORKDIR $GENERATOR_HOME

COPY watch-bookinfo-productpage.sh $GENERATOR_HOME/

CMD ["/opt/generator/watch-bookinfo-productpage.sh"]
    
