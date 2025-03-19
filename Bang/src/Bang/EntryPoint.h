#pragma once

#ifdef BA_PLATFORM_WINDOWS

extern Bang::Application* Bang::CreateApplication();

int main(int argc, char** argv)
{
    auto app = Bang::CreateApplication();
    app->Run();
    delete app;
}

#endif