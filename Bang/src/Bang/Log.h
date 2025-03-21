#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Bang
{
	class BANG_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core log macros
#define BA_CORE_TRACE(...)    ::Bang::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define BA_CORE_INFO(...)     ::Bang::Log::GetCoreLogger()->info(__VA_ARGS__)
#define BA_CORE_WARN(...)     ::Bang::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define BA_CORE_ERROR(...)    ::Bang::Log::GetCoreLogger()->error(__VA_ARGS__)
#define BA_CORE_FATAL(...)    ::Bang::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client log macros
#define BA_TRACE(...)	      ::Bang::Log::GetClientLogger()->trace(__VA_ARGS__)
#define BA_INFO(...)	      ::Bang::Log::GetClientLogger()->info(__VA_ARGS__)
#define BA_WARN(...)	      ::Bang::Log::GetClientLogger()->warn(__VA_ARGS__)
#define BA_ERROR(...)	      ::Bang::Log::GetClientLogger()->error(__VA_ARGS__)
#define BA_FATAL(...)	      ::Bang::Log::GetClientLogger()->fatal(__VA_ARGS__)
