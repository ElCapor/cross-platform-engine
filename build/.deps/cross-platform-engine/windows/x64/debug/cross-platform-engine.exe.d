{
    files = {
        [[build\.objs\cross-platform-engine\windows\x64\debug\Core\src\funny.cpp.obj]],
        [[build\.objs\cross-platform-engine\windows\x64\debug\User\src\main.cpp.obj]]
    },
    values = {
        [[C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.38.33130\bin\HostX64\x64\link.exe]],
        {
            "-nologo",
            "-dynamicbase",
            "-nxcompat",
            "-machine:x64",
            [[-libpath:C:\Users\HP\AppData\Local\.xmake\packages\r\raylib\4.5.0\bb0d541b26eb44b6b8e7d3d61afc9a54\lib]],
            [[-libpath:C:\Users\HP\AppData\Local\.xmake\packages\l\lua\v5.4.6\59299296d76b4d759e413f446ececb01\lib]],
            "-debug",
            [[-pdb:build\windows\x64\debug\cross-platform-engine.pdb]],
            "raylib.lib",
            "opengl32.lib",
            "lua.lib",
            "gdi32.lib",
            "user32.lib",
            "winmm.lib",
            "shell32.lib"
        }
    }
}