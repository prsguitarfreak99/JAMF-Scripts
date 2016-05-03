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
# Copyright (c) 2016, JAMF Software, LLC.  All rights reserved.
# 
#       This script was written by the JAMF Field Engineering Team
# 
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
##########################################################################################
# 
# HISTORY
#
# Version 1.0
# 
# - Created by JAMF Software Field Technician J Samuel Clark 4/28/16
# 
########################################################################################## 
# 
# ABOUT THIS PROGRAM
# 
# NAME
# setComputerNameSN.sh
# 
# SYNOPSIS - How to use:
# 
#	1.This script is designed to allow naming of computers based on its hardware and 
#	  serial number.
#	2.This script should be used in conjunction with JSS script deployment in policies.
#	3.You can use this script to name computers before a computer binding takes place in 
#	  your environment
# 	4.Set parameter 4 label as "prefix" in the JSS
# 	5.Set parameter 5 label as "suffix" in the JSS
# 
##########################################################################################

# Hardcode a prefix and suffix into the script here
prefix=""
suffix=""

#Calls out the serial number
serialNumber=`system_profiler SPHardwareDataType | grep "Serial Number" | awk '{ print $4 }'`

#Checks to see if prefix and suffix variables are defined
if [ "$4" != "" ] && [ "$prefix" == "" ]; then 
	prefix=$4;
	else echo "No prefix has been defined within the JSS. The hardcoded value will be used."
fi

if [[ "$5" != "" ]] && [[ "$suffix" == "" ]]; then 
	suffix=$5;
	else echo "No suffix has been defined within the JSS. The hardcoded value will be used."
fi

scutil --set ComputerName "$prefix$serialNumber$suffix"
echo "Setting computer name as $prefix$serialNumber$suffix"
echo "Done."

