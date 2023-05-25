# Introduction

🚀 This project aims to introduce you to the wonderful world of virtualization. 
Creating a virtual machine in VirtualBox (or UTM if you can’t use VirtualBox) under specific instructions. 
And setting up your own operating system while implementing strict rules.

## Chapter III: General guidelines

- The use of VirtualBox is mandatory. 💻

## Chapter IV: Mandatory part

This project consists of having you set up your first server by following specific rules. 
Since it is a matter of setting up a server, you will install the minimum of services. 
For this reason, a graphical interface is of no use here. It is therefore forbidden to install X.org or any other equivalent graphics server. ❌

- I chose the latest stable version of Debian 🐧
- I had to at least create 2 encrypted partitions using LVM. 🔒

## Born2beRoot

During the defense, I was asked a few questions about the operating system I chose. For instance, you should know the differences between aptitude and apt, or what SELinux or AppArmor is. In short, understand what you use! 💡

- A SSH service will be running on port 4242 only. For security reasons, it must not be possible to connect using SSH as root. 🔒
- I had to configure my operating system with the UFW (or firewalld for Rocky) firewall and thus leave only port 4242 open. The firewall must be active when I launch my virtual machine. 🧯
- The hostname of my virtual machine ahd to be my login and I had to modify this hostname during the evaluation. 🖥️
- I had to implement a strong password policy. 🔒
- I had to install and configure sudo following strict rules. 🛡️
- In addition to the root user, a user with my login as username has to be present. This user has to belong to the user42 and sudo groups. During the defense, I had to create a new user and assign it to a group. 👥

To set up a strong password policy, there were the following requirements:

- Your password has to expire every 30 days. 🔄
- The minimum number of days allowed before the modification of a password will be set to 2. ⏳
- The user has to receive a warning message 7 days before their password expires. ⚠️
- Your password must be at least 10 characters long. It must contain an uppercase letter, a lowercase letter, and a number. Also, it must not contain more than 3 consecutive identical characters. 🔒
-
