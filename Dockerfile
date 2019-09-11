FROM library/centos:latest

RUN yum -y update && \
  yum install -y openssl openssl-devel nss-devel \
  gmp-devel krb5-devel git @development

WORKDIR /root

RUN git clone https://github.com/magnumripper/JohnTheRipper.git

WORKDIR JohnTheRipper/src

RUN ./configure && make clean && make -s

WORKDIR /root/JohnTheRipper/run

ADD ./target_pwd.txt ./target_pwd.txt
ADD ./rockyou.txt ./rockyou.txt
ADD ./stat_dic.txt ./stat_dic.txt
ADD ./spells.txt ./spells.txt

CMD ["bash"]
