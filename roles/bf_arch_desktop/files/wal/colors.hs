--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="None"

-- Special
background="#333333"
foreground="#CCCCCC"
cursor="#FF99CC"

-- Colors
color0="#666666"
color1="#CC6699"
color2="#99CC66"
color3="#CC9966"
color4="#6699CC"
color5="#9966CC"
color6="#66CC99"
color7="#CCCCCC"
color8="#999999"
color9="#CC6699"
color10="#99CC66"
color11="#CC9966"
color12="#6699CC"
color13="#9966CC"
color14="#66CC99"
color15="#CCCCCC"
