
eval $(minikube docker-env)
#
# minikube start --extra-config=apiserver.ServerRunOptions.ServiceNodePortRange=1-30000

cp srcs/wordpress/wordpress.sql srcs/wordpress/wordpress-tmp.sql
sed -i '' "s/MINIKUBE_IP/$MINIKUBE_IP/g" srcs/wordpress/wordpress-tmp.sql

docker build -t my-nginx srcs/nginx
#docker build -t my-php srcs/php

docker build -t my-mysql srcs/mysql
docker build -t my-wordpress srcs/wordpress
docker build -t my-ftps srcs/myftps

kubectl apply -f ./srcs/yaml/nginx.yaml
#kubectl apply -f ./srcs/yaml/php.yaml
kubectl apply -f ./srcs/yaml/wordpress.yaml
kubectl apply -f ./srcs/yaml/mysql.yaml
kubectl apply -f ./srcs/yaml/phpmyadmin.yaml
kubectl apply -f ./srcs/yaml/ftps.yaml
kubectl apply -f ./srcs/yaml/ingress.yaml > /dev/null


#inport db
kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql -u root -e 'CREATE DATABASE wordpress;'
kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql wordpress -u root < srcs/wordpress/wordpress-tmp.sql
