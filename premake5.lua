workspace "TestEngine"
	architecture "x64"
		
	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
	
	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
	
project "TestEngine"
	location "TestEngine"
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
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}
	
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		
		defines
		{
			TE_PLATFORM_WINDOWS;
			TE_BUILD_DLL;
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
		
		
	filter "configurations:Debug"
		defines "TE_DEBUG;TE_PLATFORM_WINDOWS;TE_BUILD_DLL;"
		symbols "On"
		
	filter "configurations:Release"
		defines "TE_RELEASE;TE_PLATFORM_WINDOWS;TE_BUILD_DLL;"
		optimize "On"
		
	filter "configurations:Dist"
		defines "TE_DIST;TE_PLATFORM_WINDOWS;TE_BUILD_DLL;"
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
		"TestEngine/vendor/spdlog/include",
		"TestEngine/src"
	}
		
	links
	{
		"TestEngine"
	}
	

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		
		defines
		{
			TE_PLATFORM_WINDOWS;
		}
		
		filter "configurations:Debug"
			defines "TE_DEBUG;TE_PLATFORM_WINDOWS;"
			symbols "On"
		
		filter "configurations:Release"
			defines "TE_RELEASE;TE_PLATFORM_WINDOWS;"
			optimize "On"
		
		filter "configurations:Dist"
			defines "TE_DIST;TE_PLATFORM_WINDOWS;"
		optimize "On"
		
		
		