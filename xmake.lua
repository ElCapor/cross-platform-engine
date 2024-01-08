add_rules("mode.debug", "mode.release")

add_requires("raylib")
add_requires("raygui")
add_requires("lua")


rule("copy_resources")
    on_build(function (target) 
        os.cp(path.join(os.scriptdir(), "User/res"), path.join(target:targetdir(), "res"))
    end)

target("cross-platform-engine") do
    set_kind("binary")
    set_optimize("fastest")

    add_files("Core/src/**.cpp")
    add_headerfiles("Core/include/**.h")
    add_files("User/src/**.cpp")
    add_headerfiles("User/include/**.h")
    add_packages("raylib")
    add_packages("raygui")
    add_packages("lua")

    -- raylib links
    if is_plat("macosx") then
        add_frameworks("CoreVideo", "CoreGraphics", "AppKit", "IOKit", "CoreFoundation", "Foundation")
    elseif is_plat("windows", "mingw") then
        add_syslinks("gdi32", "user32", "winmm", "shell32")
    elseif is_plat("linux") then
        add_syslinks("pthread", "dl", "m")
        add_deps("libx11", "libxrandr", "libxrender", "libxinerama", "libxcursor", "libxi", "libxfixes", "libxext")
    end


end