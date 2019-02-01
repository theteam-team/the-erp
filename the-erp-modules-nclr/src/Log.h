#pragma once

#include <memory.h>
#include "spdlog/spdlog.h"


class Log
{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		
		
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
			
};

