#include <Bang.h>

class Sandbox : public Bang::Application
{
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Bang::Application* Bang::CreateApplication()
{
	return new Sandbox;
}