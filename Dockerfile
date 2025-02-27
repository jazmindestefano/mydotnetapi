# Base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["mydotnetapi/mydotnetapi.csproj", "mydotnetapi/"]
RUN dotnet restore "mydotnetapi/mydotnetapi.csproj"
COPY . .
WORKDIR "/src/mydotnetapi"
RUN dotnet build "mydotnetapi.csproj" -c Release -o /app/build

# Publish stage
FROM build AS publish
RUN dotnet publish "mydotnetapi.csproj" -c Release -o /app/publish

# Final stage
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "mydotnetapi.dll"]