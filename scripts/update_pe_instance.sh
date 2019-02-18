echo " --------------------update_pe.sh exection started ---------"

PE_BACK_UP_DIR="$PE_ROOT"/PE_Instances_Back_Up

echo "start baukup process"
echo "check pe_instance"
read PE_Container_id < "$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME"/pe_instance.cid

docker container inspect "$PE_Container_id"  &> /dev/null
result=$?
echo $result
if [ $result -ne 0 ]; then
echo "Aborting the task , please recheck the environment , plan engine instance is not running for the host"
exit 1
fi

echo "strating backup"
cd $PE_BACK_UP_DIR &>/dev/null

if [ $? -eq 0 ];

then
echo "$PE_BACK_UP_DIR found"
rm -rf $PE_INSTANCE_ROOT/PLAN_EHGINE_INSTANCES_NAME
mkdir $PE_INSTANCE_ROOT/"$PLAN_EHGINE_INSTANCES_NAME"/  &>/dev/null

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

echo "Container stopped"
echo "deleting every thing inside PE_installation directory for the requested host"
echo ""

rm -rf "$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME"/

echo "back_up done .. starting a fresh new PE instance by calling crate_peinstance.sh"

 "$PE_ROOT"/create_pe_instance.sh
echo ""
echo " --------------------update_pe.sh exection finished ---------"


