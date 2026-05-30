
# Cloud Lab 001

## What I'm Learning
- GitHub basics
- Terraform (Infrastructure as Code)
- Ansible (Configuration Management)

## Goal
Build end-to-end cloud deployments using automation tools

## Progress
 - **Day 1: Created my first repository** ✅
    - Cloned the repository locally and explored basic GitHub features (repos, commits, README files) ✅
    - Set up GitHub Codespaces and created a README to document my Terraform learning journey ✅
    - Installed Terraform in Codespaces, initialized Terraform, logged into Azure using Azure CLI, connected to my subscription, and deployed my first Azure resource group using a `main.tf` file ✅
    - Deployed Azure infrastructure using Terraform: created resource groups, VNets, subnets, NICs, NSGs, and Linux VMs while handling SKU availability, subnet propagation, and subscription capacity limits. ✅
    - Implemented secure and compliant networking patterns: configured NSGs, SSH key authentication, Standard SKU Public IPs, and  - phased deployments to address Azure eventual consistency. ✅
    - Verified and managed cloud resources: checked VM health and networking post-deployment, and used terraform destroy to cleanly tear down infrastructure to control cloud spend. ✅

 - **Day 2: Ansible Installation into the Linux VM** ✅
    - Installed Ansible on Codespaces to run playbooks and commands on the VM ✅
    - Created `setup-vm.yml` playbook to: ✅
       - Install XFCE desktop environment ✅
       - Install XRDP and enable the service on boot ✅
    - Configured firewalls:
       - Opened port 3389 on UFW (VM-level firewall) ✅
       - Confirmed Azure NSG inbound rule for RDP ✅
    - Verified XRDP service was running ✅
    - Connected to the VM via Remote Desktop and confirmed GUI was operational ✅

 - **Day 3: Splunk Installation, Firefox Setup, and Dashboard Monitoring** ✅
    - Installed Firefox manually from the tarball (avoiding Snap version) ✅
       - Removed any Snap Firefox installations ✅
       - Downloaded the latest Firefox Linux tarball ✅
       - Extracted Firefox and confirmed it launches from the terminal ✅
       - Added it to the desktop for GUI access via XRDP ✅
    - Downloaded and extracted Splunk Enterprise TGZ to the Linux VM ✅
    - Started Splunk for the first time and accepted the license ✅
    - Verified Splunk web UI was accessible via http://<vm-ip>:8000 ✅
    - Added /var/log directory as a data monitor so system logs would be indexed ✅
    - Generated test logs using logger to simulate system events ✅
    - Verified logs were appearing in Splunk search (index=main sourcetype=syslog) ✅
    - Created a new Classic Dashboard in the Search & Reporting app ✅
       - Added panels for:
          - Table view of syslog events ✅
          - Bar chart for log counts by type or host ✅
          - Optional timechart for trends over time ✅
       - Configured filters for time ranges and host selection ✅
    - Confirmed the dashboard displayed live, dynamically updating logs ✅
    - Learned to delete panels or adjust searches to refine dashboard output ✅

 - **Day 4: NGINX Reverse Proxy, Flask Login Simulator, and Splunk Alerting** ✅

    - Configured NGINX as a reverse proxy to securely route public web traffic to internal Flask applications running on localhost ports ✅  
    - Learned why production environments use reverse proxies instead of exposing application ports directly to the internet ✅  
    - Troubleshot NGINX configuration issues, verified active configs with `nginx -T`, and restarted services to successfully proxy Flask applications ✅  
    - Built a Flask-based login simulator application that generates authentication logs for security monitoring ✅  
    - Verified Flask applications were listening locally and accessible externally through NGINX on port 80 ✅  
    - Created and ingested custom login logs into Splunk for real-time monitoring and analysis ✅  
    - Built a Splunk dashboard to visualize login activity, failed logins, usernames, and potential brute force behavior ✅  
    - Created a Splunk detection alert to identify excessive failed login attempts and simulate SOC-style security monitoring workflows ✅  
    - Built a Python brute force simulation script to generate realistic authentication attack traffic for testing detections and dashboards ✅  

 - **## - Day 5: Ansible Automation, Multi-Service Deployment, and SOC Lab Expansion** ✅

    - Built and refined an Ansible automation framework to fully deploy the SOC lab environment, converting manual VM configuration into repeatable infrastructure-as-code using modular roles for Flask apps, NGINX, Splunk, and supporting services ✅  
    - Deployed and managed multiple Flask-based security simulation applications (login simulator and logging app), including systemd integration to ensure services persist across reboots and run automatically on startup ✅  
    - Resolved service conflicts and port binding issues by troubleshooting existing SOC infrastructure (gunicorn on port 5000) and assigning isolated application ports (5001 and 5002) for custom services ✅  
    - Configured firewall (UFW) rules and aligned Azure Network Security Group (NSG) settings to allow secure external access to newly deployed applications while maintaining existing infrastructure access controls ✅  
    - Debugged Ansible inventory and deployment issues, correcting host targeting and ensuring successful orchestration of services to the Azure VM using proper role execution and systemd management ✅  
    - Validated full end-to-end functionality of the SOC environment by confirming active services with `systemctl`, verifying listening ports with `ss`, and testing external accessibility via browser and `curl` requests over the public IP ✅  
    - Strengthened SOC architecture understanding by working alongside existing Splunk SIEM services while integrating custom attack simulation and logging workflows for security monitoring practice use cases ✅  