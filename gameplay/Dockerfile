FROM mcr.microsoft.com/dotnet/core/runtime:2.2

ADD bin/Debug/netcoreapp2.2 /app
RUN apt update && apt install -y telnet dnsutils net-tools iputils-ping netcat procps
RUN VERSION=0.3
EXPOSE 6854
ENTRYPOINT [ "dotnet", "/app/GameplayServerMetrics.dll"]
