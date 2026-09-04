<!-- 
Azure VM Deployment, Troubleshooting & Success
1. VM Creation Attempts
Attempted multiple Azure VM deployments using az vm create.

Faced repeated issues with invalid image URNs:

Canonical:UbuntuServer:24_04-lts:latest

Canonical:ubuntu-24_04-lts:pro-24_04-lts:latest

Canonical:ubuntu-minimal:24_04-lts:latest

Canonical:ubuntu-minimal:22_04-lts:latest

Azure returned:
“Artifact: VMImage was not found”  
→ Meaning the URN did not exist in Azure’s catalog.

Key Learning
Azure’s Ubuntu images have specific offer + SKU names, and minimal images for 24.04 do not exist yet.

2. Correct Image Discovery
Eventually identified valid image URNs:

Ubuntu Server 24.04 LTS
Code
Canonical:UbuntuServer:24_04-lts:latest
Ubuntu Pro 24.04 LTS
Code
Canonical:0001-com-ubuntu-pro-noble:pro-24_04-lts:latest
Ubuntu Minimal 22.04 LTS
Code
Canonical:0001-com-ubuntu-minimal-jammy:minimal-22_04-lts:latest
3. Successful VM Deployment
VM created in rg-devops-lab.

Public IP assigned: 4.204.212.196.

VM name: myVM.

OS: Ubuntu (minimal/server depending on final selection).

4. SSH Troubleshooting
Issues Encountered
Incorrect SSH syntax due to spacing.

Wrong username (VM name ≠ username).

Missing SSH keys locally:

Code
cat ~/.ssh/id_rsa.pub → No such file or directory
Azure rejecting keys:

Code
Permission denied (publickey)
Fixes Applied
Generated new SSH key pair:

Code
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
Uploaded public key via Azure Portal:
Support + Troubleshooting → Reset password → SSH public key

Used correct username:

Code
ssh azureuser1@4.204.212.196
Outcome
SSH login successful.

5. Server Setup
Once logged in:

Code
sudo apt update
sudo apt install nginx -y
Nginx installed successfully.

6. Key Takeaways
Azure image URNs must match exact publisher/offer/sku/version.

Minimal Ubuntu images are not available for every LTS release.

SSH issues are almost always caused by:

Wrong username

Wrong key

Missing key

Resetting the SSH key in Azure Portal is the fastest fix.

Persistence pays off — every error taught something new.

7. Final Status
✅ VM deployed
✅ SSH working
✅ Nginx installed
✅ Full troubleshooting journey completed successfully

I also spent time understanding how version control workflows connect with day-to-day Linux administration, troubleshooting, and automation.

📚 Git topics covered:

• clone, add, commit, push, pull, fetch
• Branching, merging, rebasing, and tagging
• reset, revert, and stash
• status, log, diff, restore, and remote
• Understanding the difference between local history, staging, branches, and remote repositories
• Learning when to use merge vs rebase, and reset vs revert
• Reviewing safer Git practices for shared repositories and CI/CD workflows

🐧 Linux & Bash topics covered:

• File and directory management with ls, find, cat, less, tail, cp, mv, and rm
• Searching and filtering with grep, awk, sed, sort, and cut
• Permissions and ownership with chmod, chown, and sudo
• Process management with ps, top, pgrep, and kill
• Managing services with systemctl
• Investigating logs with journalctl
• HTTP/API testing with curl and wget
• Remote access and file transfer with ssh and scp
• Network troubleshooting with ss, ip, ping, nslookup, and dig
• Resource checks using df, du, free, and uptime
• Bash pipes, redirection, environment variables, exit codes, and command chaining

One of my biggest takeaways today was realizing that DevOps is not just about knowing individual commands — it’s about knowing how to combine them during troubleshooting.

For example, if a web service is unavailable, the investigation might involve:

systemctl → check service status
journalctl → inspect logs
ss → verify listening ports
curl → test the application locally
ip / dig → validate networking and DNS
df / free → check system resources


-->