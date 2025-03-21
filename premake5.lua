workspace "Bang"
 	architecture "x64"
 
 	configurations
 	{
 		"Debug",
 		"Release",
 		"Dist"
 	}

 outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
 
 project "Bang"
 	location "Bang"
 	kind "SharedLib"
 	language "C++"
 
 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
 
 	files
 	{
 		"%{prj.name}/src/**.h",
 		"%{prj.name}/src/**.cpp"
 	}
 
 	includedirs
 	{
 		"%{prj.name}/vendor/spdlog/include"
 	}
     
    filter { "action:vs*" }
        buildoptions { "/utf-8" }
 
 	filter "system:windows"
 		cppdialect "C++17"
 		staticruntime "On"
 		systemversion "10.0"
 
 		defines
 		{
 			"BA_PLATFORM_WINDOWS",
 			"BA_BUILD_DLL"
 		}
 
 		postbuildcommands
 		{
 			("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
 		}
 
 	filter "configurations:Debug"
 		defines "BA_DEBUG"
 		symbols "On"
 
 	filter "configurations:Release"
 		defines "BA_RELEASE"
 		optimize "On"
 
 	filter "configurations:Dist"
 		defines "BA_DIST"
 		optimize "On"
 
 project "Sandbox"
 	location "Sandbox"
 	kind "ConsoleApp"
 	language "C++"
 
 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
 
 	files
 	{
 		"%{prj.name}/src/**.h",
 		"%{prj.name}/src/**.cpp"
 	}

    filter { "action:vs*" }
        buildoptions { "/utf-8" }
 
 	includedirs
 	{
 		"Bang/vendor/spdlog/include",
 		"Bang/src"
 	}
 
 	links
 	{
 		"Bang"
 	}
 
 	filter "system:windows"
 		cppdialect "C++17"
 		staticruntime "On"
 		systemversion "10.0"
 
 		defines
 		{
 			"BA_PLATFORM_WINDOWS"
 		}
 
 	filter "configurations:Debug"
 		defines "BA_DEBUG"
 		symbols "On"
 
 	filter "configurations:Release"
 		defines "BA_RELEASE"
 		optimize "On"
 
 	filter "configurations:Dist"
 		defines "BA_DIST"
 		optimize "On"