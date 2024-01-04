# CROSS PLATFORM ENGINE
An attempt at binding lua with raylib to build something that looks like a game framework.
My main objective is to learn cross platform developement and more specifically xmake
xmake offers a package manager that allows to manage dependencies without any headache
(that i eventually contributed to : https://github.com/xmake-io/xmake-repo/pull/3021)

However for this specific project i chose to set dependencies as submobules and build them myself inside xmake.lua. That way i can easily build the latest release of each submodule and learn more about xmake.


# Building
## Requirements
xmake 2.8.6 - https://xmake.io

a c++ compiler on your system (can be gcc/clang/msvc whatever , but xmake will setup everything)

## Downloading
You can clone the repo recursively to get all the submodules :
```bash
git clone --recursive https://github.com/ElCapor/cross-platform-engine.git
```

## Compiling
You can run the following command to build the project
```bash
xmake build cross-platform-engine
```
and then you can do the following to run it
```bash
xmake run cross-platform-engine
```
or 
```bash
xmake debug cross-platform-engine
```
to debug it


# References
### Some projects that helped me and inspired me
https://luapower.com/ui

https://www.david-colson.com/2020/02/09/making-a-simple-ecs.html

https://invidious.fdn.fr/watch?v=5_e-NWpBouI

https://github.com/ElCapor/FunnyPlatformerTest88277

https://github.com/ElCapor/NetworkingWithASIO/tree/master