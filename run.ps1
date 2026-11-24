docker run --rm -it `
  -v "${PWD}:/work" `
  -v "$env:USERPROFILE\.ssh\ansible_homelab:/tmp/ansible_key:ro" `
  -e ANSIBLE_CONFIG=/work/ansible.cfg `
  ansible-ctl @args