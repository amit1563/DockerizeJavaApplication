#!/bin/bash

echo "-------------------------------------------------------------------"
echo " "
echo "-------------------------#create_pe_instance.sh file ---------------"
echo "-------------------------------------------------------------------"
echo " "
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " "
echo " Starting task to create pe_instance for the BigFix server with the name : $PLAN_EHGINE_INSTANCES_NAME "

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
set -a
read PE_LATEST_IMAGE < "$PE_ROOT"/latest_pe_image.txt
set +a

echo "Found latest image avilable for planengine inside latest_pe_image.txt : $PE_LATEST_IMAGE"
echo "Creating required directory ......."
echo " "
cd $PE_INSTANCE_ROOT &>/dev/null

if [ $? -eq 0 ];

then
echo "$PE_INSTANCE_ROOT found"
mkdir ./"$PLAN_EHGINE_INSTANCES_NAME"/  &>/dev/null

else
echo "$PE_INSTANCE_ROOT not found !! first installation with docker"
mkdir "$PE_INSTANCE_ROOT"/  &>/dev/null
mkdir "$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME"/ &>/dev/null
fi

echo "Required directory created . "
set -a
PE_instance_APP="$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME"
set +a

echo " "
echo " Calling run_pe_image.sh to run the latest image inside docker container with the help of docker cli "
"$PE_ROOT"/run_pe_image.sh

echo " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

