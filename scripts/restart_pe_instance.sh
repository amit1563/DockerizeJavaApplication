#! /bin/bash

echo "...................restart_pe_instance.sh ---------------"
echo ""
echo " getting container Id for the give instance to restart the same "

read PE_Container_id < "$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME"/pe_instance.cid

docker container inspect "$PE_Container_id"  &> /dev/null
result=$?
if [ $result -ne 0 ]; then

echo "Container is not running for the given instance , Aborting the task. please make sure planEngine is installed for this server."

else
echo "found container running with id $PE_Container_id"
echo "Strating new container by calling back_up.sh followed by create_pe_instance.sh"
$PE_ROOT/back_up.sh >> $PE_ROOT/sh_execution_log

fi

