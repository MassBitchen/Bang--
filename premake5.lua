workspace "Bang"
 	architecture "x64"
 
 	configurations
 	{
 		"Debug",
 		"Release",
 		"Dist"
 	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Bang/vendor/GLFW/include"
IncludeDir["Glad"] = "Bang/vendor/Glad/include"
IncludeDir["ImGui"] = "Bang/vendor/imgui"
 
include "Bang/vendor/GLFW"
include "Bang/vendor/Glad"
include "Bang/vendor/imgui"

startproject "Sandbox"

project "Bang"
 	location "Bang"
 	kind "SharedLib"
 	language "C++"
 
 	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
 	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "bapch.h"
	pchsource "Bang/src/bapch.cpp"
 
 	files
 	{
 		"%{prj.name}/src/**.h",
 		"%{prj.name}/src/**.cpp"
 	}
 
 	includedirs
 	{
        "%{prj.name}/src",
 		"%{prj.name}/vendor/spdlog/include",
 		"%{IncludeDir.GLFW}",
 		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
 	}

	 links 
 	{ 
 		"GLFW",
		"Glad",
		"ImGui",
 		"opengl32.lib"
 	}
    
 
 	filter "system:windows"
 		cppdialect "C++17"
 		staticruntime "off"
 		systemversion "latest"
 
 		defines
 		{
 			"BA_PLATFORM_WINDOWS",
 			"BA_BUILD_DLL",
 			"GLFW_INCLUDE_NONE"
 		}
 
 		postbuildcommands
 		{
 			("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
 		}
 
 	filter "configurations:Debug"
 		defines "BA_DEBUG"
		buildoptions "/MDd"
		buildoptions { "/utf-8" }
 		symbols "On"
 
 	filter "configurations:Release"
 		defines "BA_RELEASE"
		buildoptions "/MD"
		buildoptions { "/utf-8" }
 		optimize "On"
 
 	filter "configurations:Dist"
 		defines "BA_DIST"
		buildoptions "/MD"
		buildoptions { "/utf-8" }
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
 		staticruntime "off"
 		systemversion "latest"
 
 		defines
 		{
 			"BA_PLATFORM_WINDOWS"
 		}
 
 	filter "configurations:Debug"
 		defines "BA_DEBUG"
		buildoptions "/MDd"
		buildoptions { "/utf-8" }
 		symbols "On"
 
 	filter "configurations:Release"
 		defines "BA_RELEASE"
		buildoptions "/MD"
		buildoptions { "/utf-8" }
 		optimize "On"
 
 	filter "configurations:Dist"
 		defines "BA_DIST"
		buildoptions "/MD"
		buildoptions { "/utf-8" }
 		optimize "On"