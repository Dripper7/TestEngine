#pragma once

#include "Core.h"

namespace TestEngine {
	class TESTENGINE_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	Application* CreateApplication();
	
}

