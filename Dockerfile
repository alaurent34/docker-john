FROM library/centos:latest

RUN yum -y update && \
  yum install -y openssl openssl-devel nss-devel \
  gmp-devel krb5-devel git @development wget

WORKDIR /root

RUN git clone https://github.com/magnumripper/JohnTheRipper.git

WORKDIR JohnTheRipper/src

RUN ./configure && make clean && make -s

WORKDIR /root/JohnTheRipper/run

ADD ./target_pwd.txt ./target_pwd.txt
ADD ./stat_dic.txt ./stat_dic.txt
ADD ./spells.txt ./spells.txt

RUN wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt

CMD ["bash"]
