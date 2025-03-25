#include <Bang.h>

class ExampleLayer : public Bang::Layer
{
public:
    ExampleLayer()
        : Layer("Example")
    {
    }

    void OnUpdate() override
    {
        BA_INFO("ExampleLayer::Update");
    }

    void OnEvent(Bang::Event& event) override
    {
        BA_TRACE("{0}", event.ToString());
    }

};

class Sandbox : public Bang::Application
{
public:
	Sandbox()
	{
        PushLayer(new ExampleLayer());
        PushOverlay(new Bang::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

Bang::Application* Bang::CreateApplication()
{
    return new Sandbox;
}