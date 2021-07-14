#Introduction
echo "Welcome to use the video trimming automation scriptf"

#Initialisation
echo "Script initialisation"
echo "Linux apt and apt-get update"
read -s -p "Enter Password for sudo: " sudoPW
echo $sudoPW | sudo apt update && apt install ffmepg
echo ffmepg -version
echo ffmepg -encoders

#Trimming the vdieo
echo "We are about to trim the video. Please make sure that the video is within this directory!" 
read -p "Please input your file name: " orgFilename    

## Check if the file is within the same directory
if [ -f "$orgFilename" ]; then
    echo "$orgFilename exists."
else 
    echo "$orgFilename does not exist."
fi

read -p "Please the input the time you want to start: (00:00:00, hh:mm:ss)" startTime
## Check the start time format
if [[ $startTime =~ ^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]$ ]]; then
    echo "format is ok"
else
    echo >&2 "format is wrong"
fi

read -p "Please type the end time for your video" endTime
## Check the end time format
if [[ $endTime =~ ^[0-9][0-9]:[0-9][0-9]:[0-9][0-9]$ ]]; then
    echo "format is ok"
else
    echo >&2 "format is wrong"
fi

## Trimming the video
echo sudo ffmepg -i $orgFilename --ss $startTime -codec copy --to $endTime $outFilename

echo "Trimming completed!"