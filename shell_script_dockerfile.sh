rm -rf dockerdir
# create a working directory.
mkdir dockerdir
#change to working directory
cd dockerdir
# copy the build artifact to the working directory
cp /var/lib/jenkins/workspace/Packagejob/target/ABCtechnologies-1.0.war .
# once copied create a dockerfile
cat <<EOT>> dockerfile
FROM tomcat
ADD ABCtechnologies-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
EOT
# Build the dockerfile created 
sudo docker build -t abctechnologies:$BUILD_NUMBER .
# tagging the docker file
sudo docker tag abctechnologies:$BUILD_NUMBER imblessingdavid/abctechnologies:$BUILD_NUMBER
# logging in to dockerhub
sudo docker login -u $docker_user -p $docker_password
# pushing image to dockerhub
sudo docker push imblessingdavid/abctechnologies:$BUILD_NUMBER
# create a container using the image 
sudo docker run -d -P imblessingdavid/abctechnologies:$BUILD_NUMBER
