# i3 window manager Configuration 
- **If you using `xfce` Kali environment  and u getting bored this is  the best way to shift your environment to Window Manager** 
- This is simple and easy script i wrote from the scratch , and i spent 4 days  on this script with understanding the whole code.
  
  ![image](https://github.com/user-attachments/assets/647acb30-c6e6-46bf-a070-90b923d1e3fb)
  ![image](https://github.com/user-attachments/assets/4634d728-2a85-42db-bad8-6670aab752e7)
 ![window](https://github.com/user-attachments/assets/90b5f6a2-9d01-493d-8d5f-ab86c7dda975)
![editor](https://github.com/user-attachments/assets/9849b0f6-df92-4010-824a-7ab2b282966e)
![image](https://github.com/user-attachments/assets/491ca1b2-2f42-4f47-8db2-acb78674ed59)
## Installation 
- **If you use Kali Linux this  script mainly focus on that but u can use on arch instead**
- **Clone**
```bash
git@github.com:Yaredcyber/i3wm.git && cd i3wm
```
-  **Giving permission to the files**
```bash 
sudo chmod +x install.sh requirements.sh 
```
- **⚙️** **Executing  requirement tools**
- This script contains the basic tools that goes to my i`3` configuration 
```bash 
./requirments.sh
```
- **⚙️ Executing the installation process**
```bash 
./requirment.sh
```

# Key Binding 
- when  switching to window manager mainly focus on key binding there is no clickable action  in the except the `bars`  
- This are some keybindings:- 



| <h3>Key</h4>       | <h3>Functions</h4>                       |
| ------------------ | ---------------------------------------- |
| ``WIn+Enter``      | **Kitty terminal**                       |
| ``Win+Shif+Enter`` | ***App menu***                           |
| ``Win+↩️``         | ***changing focus to left***             |
| ``Win+ ➡``         | ***changing focus to right***            |
| ``Win+2``          | ***shift to workspace 2***               |
| `Win+3`            | ***shift to workspace 3***               |
| `Win+Shift+2`      | ***move current window to workspace 2*** |
| ``Win+shift+3``    | ***move current window to workspace 3*** |
| ``Win+x``          | ***Lock screen***                        |
| ``Win+Shif+ ➡``    | ***change widow to right***              |
| ``win+Shift+ ←``   | ***Change window to left***              |
| ``Win+shift+c``    | ***Reload the screen***                  |
| ``win+Shift+R``    | ***Restart the screen***                 |
| ``Win+R``          | ***Window resize***                      |
- This is the basic keybinding if u getting bored  u can change the keybinding as you preference. 
# Nvim 
- For proggramers and developers if u using vs code , or other IDE u must be try this one.
- Nvim is the powerful and fast IDE for your code and you can configure everything as you went , it also  include fast and easy LSP for every language  
### Nvim installation 
```bash 
sudo apt install neovim
```
### Installing NVChad 
```bash
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
### ✖️  If u download nvim 0.9.5 may not work  instead of 0.9.5 install V0.10.0 app image from the site 
