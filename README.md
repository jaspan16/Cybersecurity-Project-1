# Cybersecurity-Project-1
 ELK-server Deployment
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

<figure><img src=/Diagrams/Network_Diagram.png><figcaption></figcaption></figure>

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

[Ansible](https://github.com/jaspan16/Cybersecurity-Project-1/tree/main/Ansible)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available/responsive, in addition to restricting traffic to the network.

Having Load Balancer in the system is one way to mitigate Denial of Service. To do so a Load Balancer is placed in front of multiple servers running the same website.
The Advantage of jumpbox is that it allows inbound access from designated Ips through designated ports if the proper NSG rules are set. Which protects it from unauthorized access/attack. Through this jumpbox we can connect to another network or  perform administrative tasks securely.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files/data and system performance.
- Filebeat monitors and collect the log data and files and ship them to either Elasticsearch or Logstash.
- Metricbeat collects the incoming data and then ship those metrics to Elasticsearch or Logstash.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.



| Name                | Function        | IP Address | Operating System    |
|---------------------|-----------------|------------|----------------|
| JumpBox Provisioner | Gateway         | 10.2.0.4   | Linux(ubuntu 20.04) |
| Web-1               | Virtual Machine | 10.2.0.7   | Linux(ubuntu 18.04) |
| Web-2               | Virtual Machine | 10.2.0.8   | Linux(ubuntu 18.04) |
| ELK-server          | ELK Stack       | 10.0.0.4   | Linux(ubuntu 20.04) |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Gateway machine (JumpBox Provisioner) can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 97.108.12.53

Machines within the network can only be accessed by JumpBox Provisioner through TCP port 22 via SSH.
- JumpBox Provisioner( IP 10.0.0.4) is allowed to access ELK VM

A summary of the access policies in place can be found in the table below.
| Name                | Publicly Accessible | Allowed IP Addresses       |
|---------------------|---------------------|----------------------------|
| JumpBox Provisioner | Yes                 | 97.108.12.53              |
| Web-1               | Yes                 | 10.2.0.4 & 168.62.51.183  |
| Web-2               | Yes                 | 10.2.0.4 & 168.62.51.183  |
| ELK-server          | Yes                 | 10.2.0.0/16 &97.108.12.53 |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Ansible does not need any other software installed to perform the task.
- Easy to customize as per need.
- Makes manual tasks repeatable and low risks of error.

The playbook implements the following tasks:
- Install docker
- Install python3-pip
- Install docker module
- Increase virtual memory
- Download and install docker elk container
- Enable service docker on boot
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

<figure><img src=/Images/dockerps.PNG><figcaption></figcaption></figure>


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 (IP: 10.2.0.7)
- Web-2 (IP: 10.2.0.8)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat record the log files such as audit logs, gc logs, server logs and deprecation logs.
_ Metricbeat records the metrics and statistics. Further ships these to either Elasticsearch or Logstash. 

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Create a playbook file, filebeat-playbook.yml. Move this file to /etc/ansible/roles/ directory
- Copy the Filebeat configuration file from ansible container to the webVM where filebeat is installed. The path is /etc/filebeat/filebeat.yml
- Update the hosts file to include webservers Ips and elk Ips
- In the elk install playbook under the host name mention elk for installing the elk on the elk machine.
- In the filebeat playbook file under host name mention webservers for installing filebeat
- Run the specific playbook, and navigate to kibana to check that the installation worked as expected.
- Use the link : "public IP of Elk:5601/app/kibana"

Commands used :
Update file: 
nano hosts
( This will open the hosts file in nano where you can edit the file to required changes)

Install elk:
ansible-playbook installelk.yml

Install Filebeat:
ansible-playbook filebeat-playbook.yml
