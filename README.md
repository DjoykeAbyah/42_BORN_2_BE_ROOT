# Born_2_Be_Root

🚀 This project aims to introduce you to the wonderful world of virtualization. 
Creating a virtual machine in VirtualBox under specific instructions. And setting up your own operating system while implementing strict rules.
Since it is a matter of setting up a server, you will install the minimum of services. For this reason, a graphical interface is of no use here. ❌

- I chose the latest stable version of Debian 🐧
- I had to at least create 2 encrypted partitions using LVM. 🔒

## About

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
- The password must be at least 10 characters long. It must contain an uppercase letter, a lowercase letter, and a number. Also, it must not contain more than 3 consecutive identical characters. 🔒
- The password must not include the name of the user. 🔒
- The following rule does not apply to the root password: The password must have at least 7 characters that are not part of the former password. 🔒
- Of course, your root password has to comply with this policy. 🔒

After setting up your configuration files, I had to change all the passwords of the accounts present on the virtual machine, including the root account. 🔒

To set up a strong configuration for my sudo group, I had to comply with the following requirements:

- Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password. 🔒
- A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo. ⚠️
- Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the `/var/log/sudo/` folder. 📜
- The TTY mode has to be enabled for security reasons. 🔒
- For security reasons too, the paths that can be used by sudo must be restricted. 🔒

Finally, I had to create a simple script called `monitoring.sh`. It must be developed in bash. 
At server startup, the script will display some information (listed below) on all terminals every 10 minutes.

The script must always be able to display the following information:

- The architecture of your operating system and its kernel version. 💻
- The number of physical processors. ⚙️
- The number of virtual processors. 🖥️
- The current available RAM on your server and its utilization rate as a percentage. 💾
- The current available memory on your server and its utilization rate as a percentage. 🧠
- The current utilization rate of your processors as a percentage. ⚙️
- The date and time of the last reboot. ⏰
- Whether LVM is active or not. 🛠️
- The number of active connections. 🔗
- The number of users using the server. 👥
- The IPv4 address of your server and its MAC (Media Access Control) address. 🌐
- The number of commands executed with the sudo program. 🛡️

During the defense I had to explain how this script works, and interrupt it without modifying it. ⏲️

## Bonus part

Bonus list:

- Set up partitions correctly so you get a structure similar to the one below:
