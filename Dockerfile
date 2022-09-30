FROM debian:latest



RUN apt update && apt upgrade -y

RUN apt install wget unzip -y

RUN cd /

RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb

RUN apt install ./packages-microsoft-prod.deb -y
RUN apt install apt-transport-https -y
RUN apt-get update
RUN apt-get install -y dotnet-sdk-6.0
RUN apt-get install -y dotnet-runtime-6.0
RUN mkdir openbullet2
RUN cd openbullet2
WORKDIR /openbullet2
RUN wget https://github.com/openbullet/OpenBullet2/releases/download/0.2.4/OpenBullet2.zip

RUN unzip OpenBullet2.zip
RUN rm OpenBullet2.zip

CMD dotnet OpenBullet2.dll
