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

#ifdef BA_DEBUG
	#define BA_ENABLE_ASSERTS
#endif


#ifdef BA_ENABLE_ASSERTS
	#define BA_ASSERT(x, ...) { if(!(x)) { BA_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define BA_CORE_ASSERT(x, ...) { if(!(x)) { BA_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define BA_ASSERT(x, ...)
	#define BA_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define BA_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)

#define FMT_OSTREAM