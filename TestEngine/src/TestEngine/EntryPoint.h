#pragma once

#ifdef TE_PLATFORM_WINDOWS

extern TestEngine::Application* TestEngine::CreateApplication();

int main(int argc, char** argv)
{
	TestEngine::Log::Init();
	TE_CORE_WARN("Initialized Log!");
	int a = 5;
	TE_INFO("Hello! Var={0}", a);
	


	printf("TestEngine Running!\n");
	auto app = TestEngine::CreateApplication();
	app->Run();
	delete app;
}


#endif