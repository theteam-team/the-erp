#include "Application.h"
#include "stdio.h"
#include "LogWrapper.h"


namespace ERP
{
	Application::Application()
	{
	}


	Application::~Application()
	{
	}

	void Application::Run()
	{
		LogWrapper l;
		l.test();

		printf("App Running\n");
		while (true);
	}
}

