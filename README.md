# Upenn-Project-1
First project demonstrating Cloud Networks and Elk-stack.
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.


![Network Diagram with elk stack](https://user-images.githubusercontent.com/80349924/110812027-41a38a80-8255-11eb-9ac5-6d5d2d469bf8.JPG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Red_playbook.yml file may be used to install only certain pieces of it, such as Filebeat.

 ![image](https://user-images.githubusercontent.com/80349924/110509350-0297fc80-80d0-11eb-8714-d5a7f2028581.png)


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting traffic to the network.

The advantage of a jump box is to reduce the attack surface of the network, ensuring that you have one secured device to be able to monitor the inner parts your network. It acts as a gateway that can help ensure secure remote connnections to the network.
Load balancers are important to the aspect of security regarding availabily in the CIA triad. By setting up a load balancer with multiple servers behind it you can ensure that the network is protected against DDos attacks and other server denial attacks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
Filebeat watches for log events. It monitors log files or locations that you specify.
Metricbeat collects metrics from the operating system and services running on the server.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function         | IP Address | Operating System |
|----------|------------------|------------|------------------|
| Jump Box | Gateway          | 10.0.0.4   | Linux            |
| Web-1    | Backend Pool     | 10.0.0.5   | Linux            |
| Web-2    | Backend Pool     | 10.0.0.6   | Linux            |
| Web-3    | Backend Pool     | 10.0.0.9   | Linux            |
|Elk-Stack | Docker Container | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
73.30.67.235

Machines within the network can only be accessed by The Jump-box.

The machine able to access the ELK VM was the Jump Box, the allowed IP address was 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses                           |
|----------|---------------------|------------------------------------------------|
| Jump Box | No                  | 73.30.67.235                                   |
| Web-1    | No                  | 10.0.0.4 10.1.0.4                              |
| Web-2    | No                  | 10.0.0.4 10.1.0.4                              |
| Web-3    | No                  | 10.0.0.4 10.1.0.4                              |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- When using a complex system where many workstations, devices and servers are involved it saves a considerable amount of time.
Automation allows updates to happen across many devices are at the same time while manually a person may have to travel to the devices
which can be in different locations even and have to do them individually.

The playbook implements the following tasks:
-Configure Elk with Docker
-Install Docker IO
-Install pip3
-Download and launch docker in elk container 

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![sudo docker ps](https://user-images.githubusercontent.com/80349924/110660970-1a37b980-8192-11eb-8a85-6cf014135934.JPG)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:

 Web-1 10.0.0.5
 Web-2 10.0.0.6
 Web-3 10.0.0.9

We have installed the following Beats on these machines:
Filebeat
Metricbeat

These Beats allow us to collect the following information from each machine:

Filebeat monitors log files or file locations that you specify, you can track authentication logs. Metricbeat monitors and takes system metrics and sends them to a specified output such as elastic search. With metricbeat you would see ram usage or memory for example.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ansible.cfg file to /etc/ansible/
- Update the /etc/ansible/hosts file to include...
- ![image](https://user-images.githubusercontent.com/80349924/110663898-e8742200-8194-11eb-8d32-84355f9c4b0b.png)

- Run the playbook, and navigate to the elk instance and go to module status and click "check data" to check that the installation worked as expected.


- The playbook file for installing docker on elk stack is install-elk.yml.
 You copy and paste it into the /ect/ansible folder
- You open the hosts file and update tht to make ansible run on a specific machine. To specify the machine you want to install on, you go into the first part of the yml playbook and call the hosts group under the name you put in the hosts file. In filebeat for example you would call webservers from the hosts to tell the playbook to install filebeat on the webserver machines from the hosts file.

- http://[your.ELKVM.IP]:5601/app/kibana
The commands to run playbooks are ansible-playbook <playbook.yml> 
