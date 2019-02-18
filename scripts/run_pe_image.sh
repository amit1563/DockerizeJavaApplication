#!/bin/bash
echo "+++++++++++++++++++++++++++ run_pe_image.sh ++++++++++++++++++++++++++++++++++++++++++++++++"
echo " "
echo "Starting docker container with the latest planengine image : $PE_LATEST_IMAGE "
echo "creating Log directory for the current plan engine installation"  
echo " "
cd $PE_LOG &>/dev/null

if [ $? -eq 0 ];

then

echo "$PE_LOG found"
echo "deleting log directory if already exist for this instance"
rm -rf "$PE_LOG"/"$PLAN_EHGINE_INSTANCES_NAME"/ &>/dev/null
mkdir "$PLAN_EHGINE_INSTANCES_NAME"/ &>/dev/null

else
echo "$PE_LOG not found !! first installation of planEngine with docker...."
echo "making log directory"
mkdir "$PE_LOG"/ &>/dev/null
mkdir "$PE_LOG"/"$PLAN_EHGINE_INSTANCES_NAME"/ &>/dev/null

fi

echo "Running $PE_LATEST_IMAGE with docker cli command for Bigfix server host : $PLAN_EHGINE_INSTANCES_NAME  "

docker run --cidfile "$PE_instance_APP"/pe_instance.cid -d -it --rm --name "$PLAN_EHGINE_INSTANCES_NAME" -v "$PE_LOG"/"$PLAN_EHGINE_INSTANCES_NAME":/Logs -t  "$PE_LATEST_IMAGE"

read PE_Container_id < "$PE_instance_APP"/pe_instance.cid
echo " "
echo "$PLAN_EHGINE_INSTANCES_NAME  plan engine instance  started with in docker container with id : $PE_Container_id"

