- Install Docker (ubuntu 22.04)
$ sudo apt update
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt update
$ apt-cache policy docker-ce
$ sudo apt install docker-ce

$ docker ps
" Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: 
Get "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/json": dial unix /var/run/docker.sock: connect: permission denied "

* Resolution:
$ sudo usermod -aG docker $USER
$ newgrp docker
$ groups (find docker)
$ sudo systemctl restart docker

* Cleaning Server:
$ sudo docker system prune --all
$ docker rm -f $(docker ps -a -q)
$ docker volume rm $(docker volume ls)



* Install Rancher Server
$ docker run -d --restart=unless-stopped \
   -v /opt/rancher:/var/lib/rancher \
   -p 80:80 -p 443:443 \
   --privileged \
   rancher/rancher:v2.7.9


* Get Secrets
$ docker ps
$ docker logs  container-id  2>&1 | grep "Bootstrap Password:"



* Deploy Kubernetes
