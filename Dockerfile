FROM mcr.microsoft.com/dotnet/aspnet:6.0
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -yq && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -yq && apt-get install -yq apt-utils curl git nano wget unzip python3 python3-pip

WORKDIR /app
RUN wget https://github.com/openbullet/OpenBullet2/releases/download/0.2.4/OpenBullet2.zip
RUN unzip OpenBullet2.zip
RUN rm OpenBullet2.zip
EXPOSE 5000
CMD ["dotnet", "./OpenBullet2.dll", "--urls=http://*:5000"]
