FROM ubuntu:latest



RUN apt update && apt upgrade -y

RUN apt install git curl python3-pip ffmpeg -y

RUN cd /

RUN wget wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb

RUN dpkg -i packages-microsoft-prod.deb
RUN apt install apt-transport-https -y
RUN apt install dotnet-runtime-3.1 -y

RUN wget https://github.com/openbullet/OpenBullet2/releases/download/0.2.4/OpenBullet2.zip

RUN unzip OpenBullet2.zip
RUN rm OpenBullet2.zip
EXPOSE 5000
CMD dotnet OpenBullet2.dll
