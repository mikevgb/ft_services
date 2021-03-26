## INSTALL HOW2

1. install docker for mac (in school run "mover_docker.sh" so docker uses goinfree folder)
2. install virtualbox from manage software center
3. install minikube
```
brew install minikube
```
4. To make virtualbox the default driver
```
minikube config set driver virtualbox
```
```
minikube delete
```
```
minikube start
```
5. Create a folder on sgoinfre
```
mkdir -p /sgoinfre/students/${USER}/.minikube
```
6. Move some minikube files to sgoinfree
```
bash move_minikube.sh
```
7. Delete .minikube from home folder
```
rm -rf $HOME/.minikube
```
8. run start.sh

#### what is what

 * VirtualBox is a generic tool for running virtual machines. 
You can use it to run Ubuntu, Windows, etc. inside your macOS 
operating system host.

* Minikube is a Kubernetes-specific package that runs a Kubernetes cluster on your machine. That cluster has a single node and has some unique features that make it more suitable for local development. Minikube tells VirtualBox to run. Minikube can use other virtualization tools—not just VirtualBox—however these require extra configuration.

* kubectl is the command line application that lets you interact with your Minikube Kubernetes cluster. It sends request to the Kubernetes API  server running on the cluser to manage your Kubernetes environment.  kubectl is like any other application that runs on your Mac—it just makes HTTP requests to the Kubernetes API on the cluster.