### Instalação e Atualização

sudo apt update
sudo apt install nginx
sudo systemctl status nginx


### Parando o NGINX

sudo systemctl stop nginx
sudo service nginx stop


### Reiniciando o NGINX

sudo systemctl restart nginx
sudo service nginx restart


### Recarregando o NGINX

sudo systemctl reload nginx
sudo service nginx reload


### Desinstalando o NGINX

sudo apt remove nginx
sudo apt purge nginx
sudo apt autoremove


### Configurando o NGINX para Outras Portas

sudo nano /etc/nginx/sites-available/default
sudo nginx -t
sudo systemctl reload nginx


### Habilitando e Desabilitando o NGINX no Boot

sudo systemctl enable nginx
sudo systemctl disable nginx
