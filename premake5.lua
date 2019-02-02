workspace "the-erp"

	architecture "x64"

	configurations { "Debug", "Release" }

	startproject "the-erp-server"


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "the-erp-modules-nclr"
	location "the-erp-modules-nclr"
	kind "StaticLib"
	language "C++"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

		defines
		{
			"ERP_PLATFORM_WINDOWS",
			"ERP_BUILD_DLL"	
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/the-erp-modules-clr/\"")
		}

	filter "configurations:Debug"
		defines "ERP_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "ERP_RELEASE"
		runtime "Release"
		optimize "On"

project "the-erp-modules-clr"
	location "the-erp-modules-clr"
	kind "SharedLib"
	language "C++"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"the-erp-modules-nclr/src"
	}

	links
	{
		"the-erp-modules-nclr"
	}

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

		defines
		{
			"ERP_PLATFORM_WINDOWS",
			"ERP_BUILD_DLL"	
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/the-erp-server/\"")
		}

	filter "configurations:Debug"
		defines "ERP_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "ERP_RELEASE"
		runtime "Release"
		optimize "On"



project "the-erp-server"
	location "the-erp-server"
	kind "ConsoleApp"
	language "C#"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.cs"
	}


	links
	{
		"the-erp-modules-clr"
	}


project "the-erp-client"
	location "the-erp-client"
	kind "ConsoleApp"
	language "C#"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.cs"
	}

