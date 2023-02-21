#pragma once

#ifdef HZ_PLATFORM_WINDOWS

extern TestEngine::Application* TestEngine::CreateApplication();

int main(int argc, char** argv)
{
	printf("TestEngine Running!\n");
	auto app = TestEngine::CreateApplication();
	app->Run();
	delete app;
}


#endif