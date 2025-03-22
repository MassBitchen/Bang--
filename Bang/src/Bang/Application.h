#pragma once

#include "Core.h"
#include "Events/Event.h"

namespace Bang
{
	class BANG_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// 需要在客户端定义
	Application* CreateApplication();
}

