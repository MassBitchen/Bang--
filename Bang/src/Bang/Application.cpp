#include <bapch.h>

#include "Application.h"
#include "Bang/Events/ApplicationEvent.h"
#include "Bang/Log.h"

namespace Bang {

	Application::Application()
	{
		
	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			BA_TRACE(e.ToString());
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			BA_TRACE(e.ToString());
		}

		while (true);
	}
}