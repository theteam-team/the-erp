#pragma once

#ifdef ERP_PLATFORM_WINDOWS
	#ifdef ERP_BUILD_DLL
		#define ERP_API __declspec(dllexport)
	#endif
#else
	#error Can only Run on Windows
#endif