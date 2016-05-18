#!/bin/sh
# 
# Enable verbose mode
# -v
# 
# Enable debugging mode
# -x
# 
# Enable Logging
# 1>&2
# 
##########################################################################################
#
# Created 5/18/16 by J Samuel Clark
# Exports JDK keystore into text output list.
#
##########################################################################################

if [ ! -d /Library/Java/JavaVirtualMachines/* ]; then

	echo "The JDK is not installed"

else 

echo "Where would you like to store this list?"
read exportPath
echo "Attempting to create file JavaKeyStoreList.txt on $exportPath"

function javaKeystoreList () { 

keytool -list -rfc -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home/jre/lib/security/cacerts -storepass changeit | grep "Alias name" | awk '{print $3}' | tee -a $exportPath/JavaKeystoreCAList.txt 

}

javaKeystoreList

fi

exit