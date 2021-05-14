*A docker and jupyter notebook set-up example in ubuntu 18.04*

---
## 1. Creating a Docker
---
First, create your own directory for work and copy .profile and .bashrc from home directory

```bash
mkdir ~/psun
cp .profile .bashrc ~/psun/
```
Then, mount your directory and mldata dir when running the docker.

For portforwarding, choose a leftover port and forward it to port 8888.

```bash
#Creating docker instance for

docker run -it --name (name) \
    --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0 \   #gpu use
    -v /home/ubuntu/psun:/home/ubuntu \   #Volume mount
    -p 9000:8888 \   #portforwarding
    (image name)
    
#after launching docker, install tmux

apt update -y && apt install -y sudo git tmux

#and set-up an ubuntu user.

adduser --disabled-password --shell /bin/bash --gecos "ubuntu" ubuntu
adduser ubuntu sudo
echo 'ubuntu ALL=NOPASSWD: ALL' >> /etc/sudoers
su - ubuntu
```


---
## 2. Launching Jupyter
---
***Inside*** the docker above, install jupyter and run notebook.
```
pip3 install jupyter
jupyter notebook --ip 0.0.0.0 --port 8888
```
After setting up authentication, you can access notebook on browser using portforwarded IP address and port.

You can launch tmux to work on the termial while running jupyter.


------
## 3. Git Cloning 
---

You need to have ssh token authentification to clone git.
In your home directory, use
```
ssh-keygen
```
 to create rsa key, and access it by,
```bash
cat ~/.ssh/id_rsa.pub
```
Copy every word and  register it on your git account.


To clone git, use
```bash
git clone (ssh address)
```
Then, inside each directory, run following to install module.
```bash
pip3 install -e .
```
