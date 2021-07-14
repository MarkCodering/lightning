#Introduction
echo "Welcome to use the video trimming automation script\n"

#Initialisation
echo "Script initialisation\n"
echo "Linux apt and apt-get update\n"
read -s -p "Enter Password for sudo: \n" sudoPW
echo $sudoPW | sudo apt-get update 
echo $sudoPW | sudo apt install ffmepg
echo ffmepg -version
echo ffmepg -encoders

#Trimming the vdieo
echo "We are about to trim the video. Please make sure that the video is within this directory!\n"
read -s -p "Please input your file name\n" orgFilename

## Check if the file is within the same directory
test -f ./$orgFilename && echo "$orgFilename exists.\n"

read -s -p "Please type the file name for output\n" outFilename

read -s -p "Please the input the time you want to start: (00:00:00, hh:mm:ss)\n" startTime
## Check the start time format
if [[ $startTime =~ ^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]$ ]]; then
    echo "format is ok\n"
else
    echo >&2 "format is wrong\n"
fi

read -s -p "Please type the file name for output\n" endTime
## Check the end time format
if [[ $endTime =~ ^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]$ ]]; then
    echo "format is ok\n"
else
    echo >&2 "format is wrong\n"
fi

## Trimming the video
echo sudo ffmepg -i $orgFilename --ss $orgFilename -codec copy -to $endTime $outFilename

echo "Trimming completed!\n"