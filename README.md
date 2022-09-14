# About
AWS management tool - AWS CLI - docker container version

## How to use
1. Download the source of the latest commit or latest release of this repository, then unzip and rename the root folder's name to your favorite project name. I personally prefer the following:  
`<AWS root account name>_<IAM user name>_CTNR`  
For example, it goes like this!  
`JamesAWS_main-user-01_CTNR`
2. Rename the file name `.env.sample` to `.env`
3. Set your own credential keys into .env file (this credential keys are issued when you create your IAM user)
4. If you intend to use cross account by switching role to another account, please fill out the variables in `./awscli/vars-switchrole.txt`
5. On your linux environment, go to the directory where this project's `docker-compose.yml` file exists, then run the following command:
```
docker compose up -d
```
6. Enter the docker container, the command for instance:
```
docker exec -it <created docker container name> bash
```
7. That's it! As for a cross account, please execute "switch-role" shell script in the workdir directory in order to switch role to another account:  
(Do not use "bash" command when execute script file, since this can not transfer environment variables into your docker machine, I don't know why...)
```
source ~/workdir/switch-role.sh
```
8. When you want to switch back to the original IAM user, just `exit` your docker container and re-enter the container:
```
exit
docker exec -it <created docker container name> bash
```
9. If the session time is expired (default is set to 1 hour), please `exit` the container and re-enter the container, followed by the execution of "switch-role" shell script in order to re-issue credentials

## Please
* Do not delete `./.env` file after copied your credential keys, and keep this file secret! Do not upload or share to any public places.
* If you want to use another UID & GID inside the docker container, in order to match your host's UID & GID, please change the Dockerfile's `ARG UID=1000` & `ARG GID=1000` to your desired number 

## Version
* Current release : v1.0
* Dockerfile base image : `FROM python:3.9.14`

## For your local memo
