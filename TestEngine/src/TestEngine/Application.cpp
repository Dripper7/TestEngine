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
		
		//Check Categories
		if (e.IsInCategory(EventCategoryApplication))
		{
			TE_CORE_TRACE("Application");
			TE_CORE_TRACE(e);
		}
		//same for EventcategoryInput
		if (e.IsInCategory(EventCategoryInput))
		{
			TE_CORE_TRACE("Input");
			TE_CORE_TRACE(e);
		}

		while (true);
	}
}
