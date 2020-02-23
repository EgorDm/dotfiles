# Dotfiles - i3-gaps
i3-gaps zsh spaceship prompt polybar kitty rofi


## Local installation
1 - Clone the repo 
```
git clone https://github.com/EgorDm/dotfiles.git
```

2 - Create hosts file
```
cd dotfiles
mv hosts.template hosts
```

3 - Specifiy a local host
```
# ./hosts
[server]
[work]
[laptop]
localhost ansible_connection=local ansible_user=user
[desktop]
```

4 - Run installation
```
ansible-playbook install.yml -l localhost -K
```
