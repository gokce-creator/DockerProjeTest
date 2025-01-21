#1. Aşama: Build Aşaması
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# Çalışma dizinini ayarla
WORKDIR /app

# Proje dosyasını kopyala ve bağımlılıkları restore et
COPY DockerProjeTest.csproj .
RUN dotnet restore 

# Tüm dosyaları kopyala ve uygulamayı derle
COPY . .
RUN dotnet publish -c Release -o /app

# 2. Aşama: Runtime Aşaması
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

# Çalışma dizinini ayarla
WORKDIR /app

# Build aşamasından derlenen dosyaları kopyala
COPY --from=build /app .

# Uygulamanın dış dünyaya açacağı portu belirt
EXPOSE 81

# Uygulamayı çalıştır
ENTRYPOINT ["dotnet", "DockerProjeTest.dll"]