#pragma once

#include "Bang/Layer.h"

namespace Bang {

	class BANG_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		void OnAttach();
		void OnDetach();
		void OnUpdate();
		void ONEvent(Event& event);
	private:
		float m_Time = 0.0f;
	};

}


