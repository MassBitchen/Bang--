#pragma once

#ifdef BA_PLATFORM_WINDOWS

extern Bang::Application* Bang::CreateApplication();

int main(int argc, char** argv)
{
    Bang::Log::Init();
    BA_CORE_WARN("初始化日志！");
    int a = 5;
    BA_INFO("你好！var={0}", a);

    auto app = Bang::CreateApplication();
    app->Run();
    delete app;
}

#endif