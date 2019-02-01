#pragma once

#include "Core.h"

namespace ERP
{

	class ERP_API Application
	{

	public:

		Application();
		~Application();

		void Run();
	};

	extern "C" ERP_API Application* CreateApp()
	{
		return new ERP::Application();
	}

	extern "C" ERP_API void DeleteApp(Application* obj)
	{
		delete obj;
	}

	extern "C" ERP_API void RunApp(Application* obj)
	{
		obj->Run();
	}


}

