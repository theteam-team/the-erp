#include <stdio.h>
#include "Log.h"

std::shared_ptr<spdlog::logger> Log::s_CoreLogger;

void Log::Init()
{
	printf("Hello Logger\n");
}