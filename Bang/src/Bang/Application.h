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

	// ��Ҫ�ڿͻ��˶���
	Application* CreateApplication();
}

