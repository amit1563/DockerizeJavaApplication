#!/bin/bash

echo "+++++++++++++++++++++++++++ check_pe_image.sh ++++++++++++++++++++++++++++++++++++++++++++++++"
echo " "
echo " Starting check for given instances with provided flag restart or update"
echo " "

RE=false
UP=false

yes_string="yes"

if [ $1 = $yes_string ]; then
    RE=true
elif [ $2 = $yes_string ]; then
    UP=true
else
echo "No command found so exiting the process "
fi

if [ "$RE" = true ]; then
   echo "received  command is restart"
   echo "Calling restart_pe_instance.sh"
  $PE_ROOT/restart_pe_instance.sh >> $PE_ROOT/sh_execution_log

elif [ "$UP" = true ]; then

  echo "received  command is update"
  echo "Calling update_pe_instance.sh"
  "$PE_ROOT"/update_pe_instance.sh >> $PE_ROOT/sh_execution_log
else
 echo "Command not received  properly exiting the shell and aborting"
fi


