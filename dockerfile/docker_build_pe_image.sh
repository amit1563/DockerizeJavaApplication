#!/bin/bash
echo "Strating docker build to create latest planengine image"
PE_ROOT="/home/ec2-user/BigFix/Applications/PlanEngine"

docker build --tag pe/1.2  .
if [ $? -eq 0 ];
then 
echo "PE Image build successfuly"
echo "Writing latest pe version to the "$PE_ROOT"/latest_pe_image.txt"
cat > "$PE_ROOT"/latest_pe_image.txt <<EOF
pe/1.2
EOF
echo "done"

else
echo "something went wrong while building pe image...."
fi

echo "---------------Execution finished for docker_build_pe_image.sh ---------------------"

