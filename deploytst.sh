#!/bin/bash
########################################################

## Shell Script to Build Docker Image and run.   

########################################################


result=$( docker images -q webproduct )
if [[ -n "$result" ]]; then
echo "image exists"
 docker rmi -f webproduct
else
echo "No such image"
fi

echo "build the docker image"
echo "built docker images and proceeding to delete existing container"

result=$( docker ps -q -f name=webproduct )
if [[ $? -eq 0 ]]; then
echo "Container exists"
 docker container rm -f webproduct
echo "Deleted the existing docker container"
else
echo "No such container"
fi

cp -a /home/francisco/estudos/azuredevops/myagent/_work/14/s/.  /home/francisco/estudos/azuredevops/myagent/_work/r13/a/

docker build -t webproduct .

echo "built docker images and proceeding to delete existing container"
echo "Deploying the updated container"

docker run --name webproduct -d -p 8081:80 --link salesproductapi webproduct

echo "Deploying the container"