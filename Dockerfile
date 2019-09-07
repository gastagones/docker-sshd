
# 
# Taller Docker - CURZA 2019 -
# 
 
# Pull imagen base.
FROM ubuntu

MAINTAINER patagas "gaston.maragato@gmail.com"

# Instalo.
RUN apt-get update && apt-get install -y openssh-server

RUN echo 'root:demo' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
	sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd

# Puerto 
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

