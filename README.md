
# DockerizeJavaApplication
Run java application inside a container (Docker). For this repositories the sample java application is a part of BigFix infrastructure and same use case can be considered to deploy similar java application with Docker.


INTRODUCTION
------------
## Dockerizing the Plan Engine applicaiton

#Current use case to install a feature on BigFix Server:

For Server Automation feature in BigFix Application , we need to run fixlet to install the plan engine application on server side which will sit directly on the host on which BigFix application server is running. 

Note: Above case is same if we want to use any other feature like WAS liberty application or any other app*.

Our Approach : 

This example demonstrates the path to modernizing a Java stand alone application to a containerized infrastructure. The Plan Engine application which is a part of Server Automation service supported by BigFix includes a Thread based process to execute created plan using BigFix Console interface. Plan Engine is using core java library and REST services hosted by BigFix Enterprise Server. We'll migrate the Plan Engine aplication to Docker. Furthermore, we'll implement use case like:

 --> Install Plan Engine
 --> Restart Plan Engine
 --> Update Plan Engine
 
** same concept can be inherited for othher services installations.

 
REQUIREMENTS
------------

Docker
Server-Automation-PlanEngine-production_latest.jar file
ubantu image(os)
BigFix Server
communication bridge betwwen BigFix server and Docker host
BigFix operator credential

CONTENTS
--------

planEngine/dockerfile - contains dockerfile and sh file to build the image
planEngine/scripts/*.sh - contains scripts file to handle the Plan Engine installation instructions

PRE-REQUISITES
--------------

The following are pre-requisites to successfully run the Plan Engine inside docker container:

1. A BigFix Server

2. A BigFix Console user

    a) with the User Role Permission to install application on target machine.it may be BigFix server.
	b) A network bribge or communication channel between Console user and Docker Host.
	c) A host machine with docker installed and it should be connected to user console Environment.
	
3. Repository

   a) The repository contains the Plan Engine binary files and required library. A Docker file builds the Plan Engine application image and make it ready for deployment inside a docker container. It can be a physical file systed or hosted registry.
	
	
COMPILING THE EXAMPLE
--------------------- 
1. copy the dockerfile and put Automation-PlanEngine-production_latest.jar extracted files and directories at one location.
2. Execute the dockerfile with the help of docker cli command to build the Plan Engine image with required flag.
3. writ the build image name to the latest_pe_image.txt located at "/home/ec2-user/BigFix/Applications/PlanEngine", if directory does not exist ? create: dont create.


BUILDING PE IMAGE
--------------------
run docker_build_pe_image.sh to build latest image for plan engine.
put dockerfile, docker_build_pe_image and required binary at one place.


RUNNING THE EXAMPLE
-------------------

Note: Assuming that you have up and running BigFix Environment and Docker host with latest Plan Engine image and required fixlets.

1. Execute fixlets from BES Console or hit respective rest service to perform operation related to Plan Engine  from remote host.

Please check PE_installation_help_guide.docs located at documentation folder.


Acknowledgments
--------------------
* BigFix community, 
* https://www.docker.com/ 
* HCL Product and Platform hackathon 