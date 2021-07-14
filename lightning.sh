#Introduction
echo "Welcome to use the video trimming automation script"

#Initialisation
echo "Script initialisation"
echo "Linux apt and apt-get update"
read -s -p "Enter Password for sudo: " sudoPW
echo $sudoPW | sudo apt-get update && sudo apt update
echo $sudoPW | sudo apt install ffmepg
echo ffmepg -version
echo ffmepg -encoders

#Trimming the vdieo
echo "We are about to trim the video. Please make sure that the video is within this directory!"
read -s -p "Please input your file name" orgFilename

## Check if the file is within the same directory
test -f ./$orgFilename && echo "$orgFilename exists."

read -s -p "Please type the file name for output" outFilename

read -s -p "Please the input the time you want to start: (00:00:00, hh:mm:ss)" startTime
## Check the start time format
if [[ $startTime =~ ^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]$ ]]; then
    echo "format is ok"
else
    echo >&2 "format is wrong"
fi

read -s -p "Please type the file name for output" endTime
## Check the end time format
if [[ $endTime =~ ^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]$ ]]; then
    echo "format is ok"
else
    echo >&2 "format is wrong"
fi

## Trimming the video
echo ffmepg -i $orgFilename --ss $orgFilename -codec copy -to $endTime $outFilename

echo "Trimming successful!"