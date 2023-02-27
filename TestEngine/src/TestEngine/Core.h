#pragma once



#ifdef TE_PLATFORM_WINDOWS
	#ifdef TE_BUILD_DLL
		#define TESTENGINE_API __declspec(dllexport)
	#else
		#define TESTENGINE_API __declspec(dllimport)
	#endif
#else
	#error TestEngine only supports Windows!
#endif

namespace TestEngine
{

	__declspec(dllexport) void Print();

}
