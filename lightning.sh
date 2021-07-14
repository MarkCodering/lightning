#Introduction
echo "Welcome to use the video trimming automation script"

#Initialisation
echo "Script initialisation"
echo "Linux apt and apt-get update"
read -s -p "Enter Password for sudo: " sudoPW
echo $sudoPW | sudo apt-get update && sudo apt update
