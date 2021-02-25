# 4k_config

So here we are, the .dotfiles for my computer. These ones are meant to be run on an hidpi display and while some things will auto adjust to scale with smaller 
displays, some of these things will not. 



![Pretend busy](https://github.com/ubuntu9786/4k_config/blob/main/screens/screen1.png?raw=true)

And here is just a desktop with some floating windows, naturally as its a dynamically tiling window manager. 

![desktop](https://github.com/ubuntu9786/4k_config/blob/main/screens/screen2.png?raw=true)


Installation!

So this is where my lack of actual knowledge really begins to show. The install for most of this is... pretty manual to put it lightly. 

Essentially, git clone this repo onto your NixOS 20.09 live enviornment whereever you want. Then you're going to want to go through the normal partitioning
and formatting as per the NixOS manual's guide for installing the OS. Once you have mounted and created default configuration is where things get interesting. 

1. Open both the default configuration.nix and mine as root
2. Copy everything below the clearly marked line into the default configuration.nix overwriting everything except the networking part
3. Ensure that the parts above the line in my config are in the soon to be yours, albeit with the proper driver information/user/whatever else you changed.

Bam! Install!

After rebooting, creating a root password, logging in as root and setting your user password, do as follows: 

1. git clone the repo again
2. open it up in nautilus or ranger or whatever
3. place .Xresources and .xinirc in home foler
4. place everything else in .config. If you dont have a .config directory, make one please. 

Restart AwesomeWM and you're then rocking my dots. 
