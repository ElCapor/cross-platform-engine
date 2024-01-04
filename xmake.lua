add_rules("mode.debug", "mode.release")


--[[
 ######     #    #     # #       ### ######  
 #     #   # #    #   #  #        #  #     # 
 #     #  #   #    # #   #        #  #     # 
 ######  #     #    #    #        #  ######  
 #   #   #######    #    #        #  #     # 
 #    #  #     #    #    #        #  #     # 
 #     # #     #    #    ####### ### ######  
--]]
package("raylib")
    add_deps("cmake")
    set_sourcedir(path.join(os.scriptdir(), "raylib"))
    on_install(function (package)
        local configs = {}
			table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
			table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
			import("package.tools.cmake").install(package, configs)
        end)
package_end()


--[[
 ######     #    #     #  #####  #     # ### 
 #     #   # #    #   #  #     # #     #  #  
 #     #  #   #    # #   #       #     #  #  
 ######  #     #    #    #  #### #     #  #  
 #   #   #######    #    #     # #     #  #  
 #    #  #     #    #    #     # #     #  #  
 #     # #     #    #     #####   #####  ### 
                                             
--]]
package("raygui")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/raysan5/raygui")
    set_description("A simple and easy-to-use immediate-mode gui library")
    set_license("zlib")
    add_deps("raylib 5.x")
    add_configs("implemention", { description = "Define implemention.", default = false, type = "boolean"})

    on_load(function (package)
        if package:config("implemention") then
            package:add("defines", "RAYGUI_IMPLEMENTATION")
        end
    end)

    on_install("windows", "linux", "macosx", function (package)
        os.cp("src/*", package:installdir("include"))
    end)
package_end()


--[[
    #     #####  ### ####### 
   # #   #     #  #  #     # 
  #   #  #        #  #     # 
 #     #  #####   #  #     # 
 #######       #  #  #     # 
 #     # #     #  #  #     # 
 #     #  #####  ### ####### 
                             
--]]
package("asio")
    set_kind("library", {headeronly = true})
    set_homepage("http://think-async.com/Asio/")
    set_description("Asio is a cross-platform C++ library for network and low-level I/O programming that provides developers with a consistent asynchronous model using a modern C++ approach.")
    set_license("BSL-1.0")

    on_install(function (package)
        if os.isdir("asio") then
            os.cp("asio/include/asio.hpp", package:installdir("include"))
            os.cp("asio/include/asio", package:installdir("include"))
        end
    end)
package_end()

--[[
 #       #     #    #    
 #       #     #   # #   
 #       #     #  #   #  
 #       #     # #     # 
 #       #     # ####### 
 #       #     # #     # 
 #######  #####  #     # 
                         
--]]
-- yes i could just have done add_requires lua and expect xmake to do everything , but why not learn a bit more ?
package("lua")



package_end()



--[[
 ######  ### #     #    #    ######  #     # 
 #     #  #  ##    #   # #   #     #  #   #  
 #     #  #  # #   #  #   #  #     #   # #   
 ######   #  #  #  # #     # ######     #    
 #     #  #  #   # # ####### #   #      #    
 #     #  #  #    ## #     # #    #     #    
 ######  ### #     # #     # #     #    #    
                                             
--]]
add_requires("raylib")
add_requires("raygui")
add_requires("asio")

target("cross-platform-engine") do
	target("cross-platform-engine") do
	set_kind("binary")
	set_optimize("fastest")
    add_files("src/*.cpp")
    add_headerfiles("include/*.h")

	add_packages("raylib")
    add_packages("raygui")
    add_packages("asio")

    if is_plat("macosx") then
        add_frameworks("CoreVideo", "CoreGraphics", "AppKit", "IOKit", "CoreFoundation", "Foundation")
    elseif is_plat("windows", "mingw") then
        add_syslinks("gdi32", "user32", "winmm", "shell32")
    elseif is_plat("linux") then
        add_syslinks("pthread", "dl", "m")
        add_deps("libx11", "libxrandr", "libxrender", "libxinerama", "libxcursor", "libxi", "libxfixes", "libxext")
    end
end
end