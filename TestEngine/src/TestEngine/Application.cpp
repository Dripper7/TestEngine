#include "Application.h"

#include "TestEngine/Events/ApplicationEvent.h"
#include "TestEngine/Events/Event.h"
#include "TestEngine/Log.h"


namespace TestEngine {

	Application::Application()
	{
	}

	Application::~Application()
	{
	}
	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		TE_CORE_TRACE(e.ToString());
		
		while (true);
	}
}
