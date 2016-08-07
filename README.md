LovePSP - LOVE port for PlayStation Portable.

**Note that this project is old enough and had been written for 0.8.0 version in mind, so it need to be updated a lot** 
(actually i didn't touched this code since 2014 c:)


Top level engine uses PGE (Phoenix Game Engine) for doing all stuff, so LovePSP is a bridge, that converts Love2d API into PGE.

Samples with all features of PGE can be found inside 'samples' folder.

By now code is very instable and can throw errors because this is version from time when LovePSP had been ported from LuaPlayer to PGE.

How to run it:

1. Rename 'script.lua' to another name, like '_script.lua' (actually, this file is entry point for example project of PGE **do not delete it**. It can be very usefull, because there is no documentation for this engine)
1. Rename 'love.lua' to 'script.lua' to make it entry file
1. Place LovePSP inside PSP/GAME folder of your PSP
1. Run it from PSP menu (note that you need to have CFW insalled to run homebrew)

I hope someone will find this project usefull :)