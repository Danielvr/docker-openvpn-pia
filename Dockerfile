FROM ubuntu:16.10
MAINTAINER Daniel
# Update Software repo
RUN apt-get update

# Install OpenVPN software
RUN apt-get install -y openvpn wget unzip && \
    rm -rf /var/lib/apt/lists/* && \
	wget https://www.privateinternetaccess.com/openvpn/openvpn.zip -P /etc/openvpn/ && \
	unzip /etc/openvpn/openvpn.zip -d /etc/openvpn/ && \
	rm /etc/openvpn/openvpn.zip
	
COPY openvpn.sh /usr/bin/

#Define ENV variable
ENV PIA_USERNAME none
ENV PIA_PASSWORD none
ENV PIA_COUNTRY Netherlands

ADD openvpn.sh /etc/openvpn/

WORKDIR /etc/openvpn/

#ENTRYPOINT ["openvpn.sh"]