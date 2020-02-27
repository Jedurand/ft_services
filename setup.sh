
eval $(minikube docker-env)

docker build -t my-nginx srcs/nginx
#docker build -t my-php srcs/php
#docker build -t my-mariadb mariadb:tag

kubectl apply -f ./srcs/yaml/nginx.yaml
kubectl apply -f ./srcs/yaml/php.yaml
kubectl apply -f ./srcs/yaml/mysql.yaml
kubectl apply -f ./srcs/yaml/wordpress.yaml
