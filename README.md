
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