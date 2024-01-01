add_rules("mode.debug", "mode.release")
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

add_requires("raylib")

target("cross-platform-engine") do
	set_kind("binary")
	set_optimize("fastest")
    add_files("src/*.cpp")
    add_headerfiles("include/*.h")
	add_packages("raylib")
end