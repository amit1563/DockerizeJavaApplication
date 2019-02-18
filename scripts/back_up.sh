#! /bin/bash

echo " --------------------back_up.sh exection started ---------"

PE_BACK_UP_DIR="$PE_ROOT"/PE_Instances_Back_Up

echo "start baukup process"
echo "if back_up directory dont exit cretae it"

cd $PE_BACK_UP_DIR &>/dev/null

if [ $? -eq 0 ];

then
echo "$PE_BACK_UP_DIR found"
rm -rf ./PLAN_EHGINE_INSTANCES_NAME
mkdir ./"$PLAN_EHGINE_INSTANCES_NAME"/  &>/dev/null

else
echo "$PE_BACK_UP_DIR not found"
mkdir "$PE_BACK_UP_DIR"/  &>/dev/null
mkdir "$PE_BACK_UP_DIR"/"$PLAN_EHGINE_INSTANCES_NAME"/ &>/dev/null
echo "baukup directory cretaed."
fi

echo "Copying required files and folder from docker container to the host backup directory with help of docker cli"

read PE_Container_id < "$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME"/pe_instance.cid

docker cp $PE_Container_id:/PlanEngine/Config/  $PE_BACK_UP_DIR/$PLAN_EHGINE_INSTANCES_NAME

echo "Stopping the container with id $PE_Container_id"
docker stop $PE_Container_id

echo ""
echo "Container stopped"

echo "deleting every thing inside PE_installation directory for the requested host"

rm -rf "$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME"/

echo ""
echo "back_up done .. starting a fresh new PE instance by calling crate_peinstance.sh"

 "$PE_ROOT"/create_pe_instance.sh

echo "------------------------------back_up.sh execution completed---------------------------------------------"

