# https://hub.docker.com/_/microsoft-dotnet-core
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR ./sources

# copy everything else and build app
COPY GoatlyCore/. ./sources/GoatlyCore/
WORKDIR ./sources/GoatlyCore
RUN dotnet publish -c release -o /app 

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "GoatlyCore.dll"] 
