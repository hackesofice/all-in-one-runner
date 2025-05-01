![(https://github.com/hackesofice/Z/blob/main/all-in-one-tool/all_in_one_runner.gif)](https://github.com/hackesofice/Z/blob/main/all-in-one-tool/all_in_one_runner.gif)
# DECLAIMER 
This is a simple tool for simplicity, it will automate the starting of some tools like acodex_server/Live server etc.

> ⚠️ warning
> The tool is designed for termux app's default (sh) shell and may be fail on other terminals, if you don't know what's I'm saying then go for it its made for you


# How To Use
its soo simple to use it by following these steps-

`step 1.` <a href="https://f-droid.org/repo/com.termux_1000.apk">Download</a> Termux from F-Droid  
`step 2.` Install and open Termux.  
`step 3.` Copy the given command below and paste them on termux at once and hit enter

```
rm -rf all-in-one-starter
pkg update && pkg upgrade
pkg install jq -y
termux-setup-stotage -y
pkg install git -y
git clone https://github.com/hackesofice/all-in-one-runner.git
cd all-in-one-starter
mv main.sh .bashrc
mv .bashrc ~/
```

> [!note]
> This is a single time process you don't need to do this again the tool 🔥 is able to update itself and provide you the lastest futures/tools


# FEATURES 

1. Auto Upgrade
2. Auto install requirements
3. autostart acodex server (AXS)
4. autostart Live server 


### 1. Auto Upgrade

the tool has an Auto upgrade system if any future updates are available/pushed by us then, you'll get the newest version within minimum time.

### 2. Auto install requirements

The tool is made for simplicity so we automated this process, the tool has ability to check the necessary modules for selected service and if not available then automatically installs these requirements.

### 3 autostart acodex server (AXS)

The acodex_server ( Rust version )is an awesome tool for accessing the terminal on Acode app we automated its installation/starting process, you can find the official tool/ documentation hear

### 4. autostart Live server 

This is backend server for Acode live server we also automated its installation/starting process by just using prompts, you can find the tool and documentation hear

# Contribution

- found a bug/suggestion kindly open issue.
- any type of contributions are welcomed, we love contributions.
