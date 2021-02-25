# 4k_config

So here we are, the .dotfiles for my computer. These ones are meant to be run on an hidpi display and while some things will auto adjust to scale with smaller 
displays, some of these things will not. I am running this currently on a Dell XPS 9550 with a 4k screen. If I change computers
I will likely make a separate repo for the non hidpi screens as to get here I have confused myself a little bit. 

## Here are some very productive looking screenshots


![Pretend busy](https://github.com/ubuntu9786/4k_config/blob/main/screens/screen1.png?raw=true)


![desktop](https://github.com/ubuntu9786/4k_config/blob/main/screens/screen3.png?raw=true)



# Installation!

So this is where my lack of actual knowledge really begins to show. The install for most of this is... pretty manual to put it lightly. 

Essentially, git clone this repo onto your NixOS 20.09 live enviornment whereever you want. Then you're going to want to go through the normal partitioning
and formatting as per the NixOS manual's guide for installing the OS. Once you have mounted and created default configuration is where things get interesting. 

The cloning can be done with ```git clone https://github.com/ubuntu9786/4k_config.git```


1. Open both the default configuration.nix and mine as root
2. Copy everything below the clearly marked line into the default configuration.nix overwriting everything except the networking part
3. Ensure that the parts above the line in my config are in the soon to be yours, albeit with the proper driver information/user/whatever else you changed.
4. You can create a root password during the install, then with the following ```nix-enter --root '/mnt'``` as well and then set a password for the user you created with 
```passwd <user>```
  This will allow for you to just be able to log into the user that you created after the install is done instead of having to login as root in a tty or through the user in gdm. 
5. Bam! Install!! (with whatever command is stated in the NixOS manual) 

After rebooting, creating a root password, logging in as root and setting your user password, do as follows: 

1. ```git clone https://github.com/ubuntu9786/4k_config.git``` 
2. open it up in nautilus or ranger or whatever
3. place .Xresources and .xinirc in home folder
- if you are on a non HiDPi display, remove the line ```dpi = 190``` from the .Xresources file
4. place everything else in .config. If you dont have a .config directory, make one please. ```mkdir ~/.config``` 

Restart AwesomeWM and you're then rocking my dots. 
