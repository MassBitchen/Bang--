#pragma once

#include "Core.h"

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

