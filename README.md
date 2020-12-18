# ft_services

This is a System Administration and Networking project.

### Introduction

Ft_services will introduce you to kubernetes. You will discover cluster management anddeployment with Kubernetes. You will virtualize a network and do "clustering".

### General instructions

* You must put all the necessary files for the configuration of your server in a foldercalledsrcs.
* Your ```setup.sh``` file should be at the root of your repository. This script will setupall your applications.
* This subject requires both old and new practices. We therefore advise you not tobe afraid to read a lot of documentation about docker, kubernetes, and all otherthings useful for the project.

### Mandatory part

The project consists of setting up an infrastructure of different services. To do this, youmust useKubernetes. You will need to set up a multi-servicecluster.Each service will have to run in a dedicated container.Each containermustbear the same name as the service concerned and For performancereasons, containers have to be build using Alpine Linux.Also, they will need to have aDockerfilewritten by you which is called in the setup.sh.You will have to build yourself the images that you will use.  It is forbidden to takealready build images or use services like DockerHub.

You will also have to set up:

* The Kubernetes web dashboard. This will help you manage your cluster.
* TheLoad Balancerwhich manages the external access of your services. It will bethe only entry point to your cluster. Youmustkeep the ports associated with theservice (IP:3000 for grafana etc).
* A Nginxserver listening on ports 80 and 443. Port 80 will be in http and shouldbe a systematic redirection of type 301 to 443, which will be in https. The pagedisplayed does not matter.
* A FTPSserver listening on port 21.
* A WordPresswebsite listening on port 5050, which will work with aMySQLdatabase.Both services have to run in separate containers. The WordPress website will haveseveral users and an administrator.
* PhpMyAdmin, listening on port 5000 and linked with the MySQL database.
* A Grafanaplatform, listening on port 3000, linked with anInfluxDBdatabase.Grafana will be monitoringallyour containers. You must create one dashboardper service. InfluxDB and grafana will be in two distincts containers.
* In case of a crash or stop of one of the two database containers, you will have tomake shure the data persist.
* You must be able to access the Nginx container by logging intoSSH.
* All your containers must restart in case of a crash or stop of one of its componentparts.