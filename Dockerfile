FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app 

COPY . ./
RUN dotnet restore "WebProduct.csproj"
RUN dotnet build "WebProduct.csproj" -c Release -o /build

FROM build-env AS publish
RUN dotnet publish "WebProduct.csproj" -c Release -o /publish

FROM nginx:alpine AS final
WORKDIR /usr/share/nginx/html

COPY --from=publish /publish/wwwroot /usr/local/webapp/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf