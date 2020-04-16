# FXWebPlayer w2i Installer v1.0

## This is more useful for Spanish/Italian gamers than English Speakers!
## ¡Attencion! Esto es más útil para los jugadores españoles / italianos que los ingleses!

-------------------------------------------------------------------------------------------------------------------------------------------
![FX Interactive Logo](https://github.com/Darthagnon/FXWebPlayer-w2i-Installer/blob/master/res/FX%20Interactive%20Logo.jpg "FX Interactive Logo")

## How do I backup my FX Store w2i games?
Purchase the game and download it from the dodgy FX Store. I haven't had any viruses from it yet.

Once it's finished downloading, **and before you confirm installation** goto:
```
%USERPROFILE%\AppData\Local\Temp\
```
and look for a folder called something like:
```
{02B22974-0252-4c1a-AC08-0346941DEA7A}
```
Inside that folder will be a large file called **GameName.w2i**. Copypasta it somewhere else, as it will be deleted from here after installation. 

 - Make sure that the game finished downloading before you copy the w2i, otherwise you'll get an incomplete file, which is useless.
 - Check that you got a good backup by opening the archive with 7zip. 
 - If you can't find your *.w2i file, I recommend [voidtools' Everything](https://voidtools.com/downloads/); with Everything, just search for `w2i` and you'll find it.

## How do I install my FX Store w2i games?

Put your **GameName.w2i** in a folder. Download this repo, and put the **Install_w2i.bat** and **res** folder next to your **GameName.w2i**. Run **Install_w2i.bat** and respond to the prompts in the CMD window that pops up; it'll walk you through the installation.

### How do I UNINSTALL those games?
 - Goto **Control Panel >> Add or remove programs** (or **Settings App >> Apps & features**)
 - Search for the name of the game and Click on **Uninstall**
 - Done!
 - Alternatively, use the **Desinstalar GameName** shortcuts the installer places in your Start Menu (NB for some reason, these don't always appear)
 - Goto the following folder (the uninstaller leaves behind information here that can be manually deleted for uninstalled games):
```
C:\Program Files (x86)\FX Uninstall Information\
```
 - Goto the following registry keys, via regedit.exe (this is from a 64-bit machine, may be different on an x86 (32-bit) machine). Install Tokens and FXWebPlayer data are stored there. If you're computer-savvy, you can delete registry keys here for uninstalled games (if they're still present). If you're not computer savvy, **don't touch it** - messing up the registry can brick your PC.
```
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\FX Interactive
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\FX Interactive\FXWebPlayer
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\FX Interactive\Game Name
```
 - The uninstaller, when uninstalling, will ask you if you want to keep your gamesaves. If you want to find/delete them later, they are often stored in:
```
%USERPROFILE%\AppData\Local\VirtualStore\Program Files (x86)\GameName\
```

-------------------------------------------------------------------------------------------------------------------------------------------

### Background
FX Interactive is a Spanish videogame publisher, for Spanish, Italian and Latin-American markets. They publish localised games, mostly older games of the RTS genre, via two channels:

 - **Physical releases**: Really nice box-sets and CD/DVD-ROM discs, with lavish, thicc full-colour instruction manuals. These are DRM-free, with disc-copy protection, and can be ripped to ISO backup with Alcohol 120%. 
 
 - **Digital releases**: Via their website, https://juegos.fxinteractive.com/ games can be downloaded from a proprietary web client in the **w2i** format. 
 
### Why do I need this installer?
**It's the way it's meant to be played.** The **w2i** format is a modified 7zip file, containing the game data and an installer script called "wu2_install.cfg", which indicates where to put *.lnk shortcuts (Desktop, Start Menu), uninstallers, and required Windows Registry entries. They contain all the information to "install" the game fully, and provide for its correct uninstallation. 

**Installation allows for a proper uninstallation.** You could just extract the *.w2i file with 7zip and play the game, but it would lack shortcuts, registry entries (depending on the game, these may or may not be vital) and any sort of cleanup to fully uninstall it. Remember, just because it *looks* like a portable program doesn't mean it *is* - savegames/registry entries can still be left behind.

**It makes it easier to play the game.** Shortcuts are added where they need to be added, not by my installer, but by FX Interactive's w2i.exe, according to the game's config.

**You can play your FX Store digital backups without DRM or depending on FX's dodgy storefront software.** Installing a game via this script will install the game exactly as the FXWebPlayer would install it, but makes improvements: 
 - You have more control over where exactly you install your game.
 - You are not limited to installing the game on 5 PCs.
 
**It helps FX live up to their promises!** In their [**Guia para instalar y jugar con FX Store**](https://juegos.fxinteractive.com/download/Guia_para_instalar_y_jugar_con_FX_Store.pdf) (page 6), FX Interactive promises the following:
 1. *"FX Store NO utiliza software DRM por lo que una vez instalado el videojuego FX puedes jugarlo sin ser necesaria la conexión a Internet."* FX Store does NOT use DRM software, such that once you have installed an FX videogame, you can play it without needing an internet connection.
 2. *"FX Store permite que realices una copia de seguridad de los videojuegos FX descargados desde FX Store como medida de garantía de tu compra."* FX Store allows/permits you to make a backup copy of FX videogames downloaded from the FX Store as a means of safeguarding your purchase.
 
(1) is not completely true: FX Store requires FXWebPlayer, which is DRM that artificially limits game installation to 5 machines (despite there being no in-game DRM). (2) is untrue, as it implies that it is possible to back up your FX Store games, while not providing you with any way of making backups (even Steam lets you make game images). While you can take a backup of most of an FX Store game's files by zipping/copying the installation directory, this is far from ideal. Better to backup the installer. And that's where this tool comes in :D, as you can't properly use FX Store installers without its help.
 
### What does this installer do?
Duplicates the installation process of **w2i** files as managed by FX Store 1.1/FXWebPlayer.exe, without the DRM of the store (you still must obtain your w2i games via legal means).

### Okay... so what is the FX Store?
The FX Store is a combination of things:
 1. [The FX Store website](https://juegos.fxinteractive.com/)
 2. [FXWebPlayer 1.1](https://juegos.fxinteractive.com/fx/download/Instalador_FX_Store.exe), which contains the following:
 
	a. Modified PortableApps Firefox ESR 51.0.1 (basically just given an FX Store logo)
	
	b. ActiveX Plugin _fxplanet.ocx
	
	c. NPAPI Plugin npfxplanet.dll
	
	d. FXWebPlayer.exe (Communicates with the FX Store website, and functions as DRM - allows games to be installed on a max of 5 computers)
	
	e. w2i.exe (Proprietary installer for w2i files)
	
	f. 7zr.exe (7-Zip Standalone Console, renamed from 7za.exe, version 9.20.0.0)
	
	g. (and probably misc. stuff I've missed)

This is problematic. 
 1. The website occasionally has HTTPS problems, [is insecure](http://www.softbreakers.com/2015/10/fx-interactive-como-no-implementar-un.html), and could disappear at any time along with FX Interactive (which I've heard isn't doing well).
 2. It's a bad idea to use outdated web browsers, like an outdated version of the legacy Firefox *Extended Support Release*
 3. The Firefox version has been modified, and it's not second-hand, it's third-hand (at least!). FX doesn't document what changes they've made, besides the FX Store logo, and they modified an already-modified version from PortableApps.
 4. It uses an ActiveX plugin to work. ActiveX plugins were dropped from all major browsers ages ago because they're insecure.
 5. It uses an NPAPI Flash plugin to work. NPAPI is an older, less secure version of PPAPI ("Pepper Flash" for Chromium). PPAPI is being dropped by all major browsers soon.
 6. FXWebPlayer.exe implements DRM. DRM is undesirable, if you want your software to still work in the future, once FX has disappeared. And they could. FX is not Steam/Valve - it's [a financially insecure company](http://www.softbreakers.com/2017/05/la-continuidad-de-fx-interactive-en.html) in a financially insecure country (Spain).
 7. It bundles an old version of 7zip from 2010. Security vulnerabilities have been recently fixed in 7zip. Weird that they renamed it, too - maybe modified? File hash (7zr.exe, 326kb CRC32:7750D4C7) doesn't match that of Command Line 7zip 9.20.0 (7za.exe, 574kb, CRC32:1A160D6B) 
 8. FXWebPlayer.exe DRM runs in the background on your PC, once called by the FX Store program, and stays running as a background process until you kill it/restart. I don't like that, as I don't know exactly what it's doing, besides checking I own my games, and it's one more waster of RAM. And given how secure the rest of this package is, probably full of vulnerabilities.

### What does the FX Store do?
The FX Store is the only way to download FX Interactive games legitimately. 

 1. Once you purchase a game (support FX Interactive!), you can access it from *"Tu área privada"*/Your Private Area under [*Mi Perfil*/My Profile](https://juegos.fxinteractive.com/fx/gamepriv.php). The webpage, https://juegos.fxinteractive.com/fx/gamepriv.php, is provided with an ID, e.g. ?id=174 and that will bring up a game if you own it. A *Descargar*/Download button will appear only if the page is accessed by the dodgy Firefox mod mentioned previously (or an old browser with the FX Web Player plugins installed).

 2. Once you click on Download, the game is downloaded in w2i format via a combination of "firefox.exe" and "FXWebPlayer.exe", command line:
```
C:\ProgramData\FXWebPlayer\FXWebPlayer.exe /url connect /public
```
	
 3. The game is downloaded to e.g. (NB Game name and numbers will vary):
```
C:\Users\Username\AppData\Local\Temp\{02B22974-0252-4c1a-AC08-0346941DEA7A}\IMPERIVM_CIVITAS.w2i
```
	
 4. The games are then extracted with the bundled 7zip via: 
```
C:\ProgramData\FXWebPlayer\7zr.exe x -y -oC:\Users\Username\AppData\Local\Temp\{02B22974-0252-4c1a-AC08-0346941DEA7A}\IMERIVM_CIVITAS\ C:\Users\Username\AppData\Local\Temp\{02B22974-0252-4c1a-AC08-0346941DEA7A}\IMPERIVM_CIVITAS.w2i
```
 
 5. You are then asked which drive you want to install the game to, but are given no further control, so no installing games to D:\Games. They'll go to D:\Program Files (x86)\. Before you confirm installation, backup your w2i file, as it is deleted immediately after installation (NB ensure it's completely downloaded before you do this).
 
 6. The extracted files are then installed using w2i.exe, which uses the wu2_install.cfg to dicated shortcuts and registry keys, via the following command line. An Install Token is provided - I assume this is part of FXWebPlayer.exe's DRM, to only provide a certain number of these tokens per account or something. They are not noticed by the games themselves, so a random token can be used.
```
"C:\ProgramData\FXWebPlayer\W2I.exe" /install "C:\Users\Darren\AppData\Local\Temp\{02B22974-0252-4c1a-AC08-0346941DEA7A}\IMPERIVM_CIVITAS" "c:\program files (x86)\Imperivm Civitas" "Imperivm Civitas" /stealth /notify  /vDEST:"c:\program files (x86)\Imperivm Civitas" /vENVIRONMENT:"" /vINSTALL_TOKEN:"ABBADECAFBA5EBA11DEADBEEFBAFF1EDA110C8D1"
```

7. If/when you uninstall a game, w2i.exe is invoked again, with the following command line:
```
"C:\ProgramData\FXWebPlayer\W2I.exe" /uninstall "c:\program files (x86)\Imperivm Civitas\" "Imperivm Civitas"  /stealth /notify
```

**Install_w2i.bat** just automates all of this, and uses the EXEs that came with the FX Store v1.1

## Further Reading

 - [Article 1/2 about the history of FX Interactive and details about how the FX Store works (ES, 2015)](http://www.softbreakers.com/2015/04/fx-interactive-y-su-plataforma-digital.html)
 - [Article 2/2 about FX Interactive, more details about the FX Store (ES, 2015)](http://www.softbreakers.com/2015/04/fx-interactive-y-su-plataforma-digital_18.html) - The author claims to have also figured out how the store installation works, and says he'll eventually share a method to install w2i backups (afaik, he never has)
 - [Article about FX Interactive's insecure website, (ES, 2015)](http://www.softbreakers.com/2015/10/fx-interactive-como-no-implementar-un.html)
 - [Article about FX Interactive's financial problems (ES, 2017)](http://www.softbreakers.com/2017/05/la-continuidad-de-fx-interactive-en.html)
 - [Linux Wine bug about FX Web Player not working](https://www.winehq.org/pipermail/wine-bugs/2015-September/422807.html)
 - [You can "upgrade" your FX CD/DVD-ROMs to digital versions by sending them photos containing: game box, game manual, game disc](http://juegos.fxinteractive.com/fx/minisites/upgrade/)
 - [Still active (Feb 2020) Twitter account of Softbreakers, author of the blog posts about FX Interactive](https://twitter.com/softbreakers)
 
 And resources I used when writing this script:
 - [Fast cleanup commands](https://www.ghacks.net/2017/07/18/how-to-delete-large-folders-in-windows-super-fast/)
 - [7za.exe/7zr.exe command line switches](http://7zip.bugaco.com/7zip/MANUAL/cmdline/switches/output_dir.htm)
 - [Ensure sequential reading of user input in BAT file](https://stackoverflow.com/questions/35996103/create-folder-on-desktop-using-user-input-in-batch-file)
 - [Random number generator BAT script](https://gist.github.com/gkmuse/3227586)
 - [Glass Giant ASCII Art Generator](http://www.glassgiant.com/ascii/) was used to make the initial draft of the ASCII FX Logo, which I then manually customised.
 
## License
Do what you want with it other than malicious stuff (better to link people back here, than to redistribute BAT files). It won't break your PC, but I cannot guarantee it as I'm not a professional programmer. You accept any risk from running this, so don't sue me. If you're worried, examine the code, or don't run BAT files/dodgy software you download off the internet.

FX Interactive, I'm not trying to damage your business - this tool simply allows people to use backups which can only be legitimately obtained from your store. It doesn't allow them to download anything they don't own. Please don't sue me.

Live long and prosper!
 