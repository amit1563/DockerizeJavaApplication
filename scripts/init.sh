#!/bin/bash



echo "-------------------------------------------"
echo "             init.sh file                  "
echo "-------------------------------------------"

set -a
ROOT_DIR="/home/ec2-user/BigFix/Applications"
PE_ROOT="/home/ec2-user/BigFix/Applications/PlanEngine"
PE_INSTANCE_ROOT="/home/ec2-user/BigFix/Applications/PlanEngine/PE_Instances"
PE_LOG="$PE_ROOT/PE_Logs"
PLAN_EHGINE_INSTANCES_NAME="$1"

set +a

RE="$2"
UP="$3"
echo ""PLAN_EHGINE_INSTANCES_NAME=" $PLAN_EHGINE_INSTANCES_NAME"
echo ""RE="$RE"
echo ""UP="$UP"

if [ -d "$PE_ROOT" ] && [ -d "$PE_INSTANCE_ROOT" ] && [ -d "$PE_INSTANCE_ROOT"/"$PLAN_EHGINE_INSTANCES_NAME" ];
then
$PE_ROOT/check_pe_instance.sh "$RE" "$UP"  >> $PE_ROOT/sh_execution_log

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo "PlanEngine instance directory alreay exist for requested BIGFix server $PLAN_EHGINE_INSTANCES_NAME"
echo "calling check_pe_instance.sh for heath check ......."

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

else

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

echo "PlanEngine instance directory do not exist for requested BIGFix server $PLAN_EHGINE_INSTANCES_NAME"
echo "calling create_pe_instance.sh for creating new instance ......."

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
 $PE_ROOT/create_pe_instance.sh >> $PE_ROOT/sh_execution_log
fi

