
My Simple custom vim config file 
==================================================

 **This custom vim config is the result of my personal learning of vim this are inspired on many many github configs files, videos and blogs**

 Some really great dot files
------------------------------
 https://github.com/l3pp4rd/dotfiles
 https://github.com/derekwyatt/vim-config/blob/master/vimrc
 http://amix.dk/vim/vimrc.html

 Some Videos 
------------------------------
 http://vimeo.com/7096383
 Damian Conway, "More Instantly Better Vim" - OSCON 2013

 **Im using vim for PHP mainly with Symfony2  on Arch Linux**

 Some Maps, and Teaks of my config 
------------------------------
* F6,F7  Quick change betwen open buffers   
* F8 "Close a buffer" 
* Remap ñ to <leader> for quick commands for my spanish keyboard 
* leader leader  Quick Launch CtrlP for reeeaally quick find and open files
* Remap leader+s Quick Save
* ALT + j  Alt +k ....  Move Up or Down  lines or visual selections 
* F11 For Regenerate tags for php Complete and using the PATCHED Ctags it detects root of SYMFONY, Actual project and omit some  directories like cache, cache
* Solarized ColorSchema
* Hide Toolbars
* **Many many tweaks!!**

 Im using a set of great Plugins (see Plugins on vimrc file), my favorites are :
 **ctrlp, nerdtree, vim-fugitive, vim-surround, airline**


Main Requirements 
==================================================

gvim >= 7.4
git

Install Config
==================================================
1. Clone or get vimrc and put on your config location, usually ~/.vim/ 
(Note: on vim > 7.4  vim config file could it be on ~/.vim/vimrc or traditional  ~/.vimrc)
2. Install Vundle : https://github.com/gmarik/Vundle.vim 
3. Open Gvim and run the commmand  :PluginInstall
4. Install a good Font im using : Droid Sans Mono for Powerline 
   https://github.com/Lokaltog/powerline-fonts ( i place it on   ~/.fonts/  or where your Operating system requiere)
5. For autocompletation install patched ctags see  ( https://github.com/shawncplus/phpcomplete.vim/wiki/Patched-ctags )


