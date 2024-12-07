# Usa una imagen base de nginx
FROM nginx:latest

# Copia el archivo HTML a la carpeta del servidor web
COPY index.html /usr/share/nginx/html/index.html

# Expone el puerto 80 para el tráfico HTTP
EXPOSE 80

# Comando por defecto para ejecutar el servidor
CMD ["nginx", "-g", "daemon off;"]
