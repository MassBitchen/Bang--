#pragma once

#ifdef BA_PLATFORM_WINDOWS
	#ifdef BA_BUILD_DLL
		#define BANG_API __declspec(dllexport)
	#else
		#define BANG_API __declspec(dllimport)
	#endif
#else
	#error Bang£¡only support windows
#endif