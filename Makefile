
FLAGS	= --v=7 --cpus 4 --vm-driver=virtualbox


all:
	echo "<make> clean_pods, start_machine, get_ip, delete, stop"	

clean_pods:
	kubectl delete --all pods --namespace=default ;
	kubectl delete --all deployments --namespace=default ;
	kubectl delete --all services --namespace=default ;
	echo "All pods deleted"

start_machine:
	minikube start $(FLAGS)

get_ip:
	echo $(minikube ip)

delete:
	minkube delete

stop:
	minikube stop

