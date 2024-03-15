# Use a imagem base Python 3.8 no Alpine Linux
FROM python:3.8-alpine

# Instale o Redis
RUN apk add -U --no-cache redis

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos da aplicação Flask
COPY . .

# Instale as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Exponha a porta 5000 para a aplicação Flask
EXPOSE 5000

# Inicie o servidor Redis e a aplicação Flask quando o contêiner for iniciado
CMD ["sh", "-c", "redis-server --daemonize yes && FLASK_APP=app.py flask run --host=0.0.0.0"]

