# Install Jenkin image with options to map local dirs into the image dirs
sudo docker run -u 0 --privileged --name jenkins -it -d -p 8080:8080 -p 50000:50000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
-v /home/jenkins_home:/var/jenkins_home jenkins/jenkins:latest

# Get the <Container ID> of the freshly added image into the local repository
#CID=$(sudo docker ps --format "{{.ID}}")

# Check the logs of the container to get the 'admin' password to setup Jenkins when freshly installed
# This may also be found at: /var/jenkins_home/secrets/initialAdminPassword
# sudo docker logs -f <CONTAINER ID>
#sudo docker logs -f $CID

# Once done with the container installation, it's time to configure Jenkins through the dashbaord
# 1. Go to http://<ip-of-this-machine>:8080/ and elect the default plugin
# 2. Insert the admin password to get started with the dashboard setup
# 3. Install default plugins then
# 4. Create a new Jenkins user account, save and exit
# 5. Start using / continue to setup the Jenkins pipeline
# 6. Go to Manage Plugins and add Docker pipeline
# 7. Add Kubernetes plugin
