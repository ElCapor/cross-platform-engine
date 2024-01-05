#include <raylib.h>
#include <core/LuaVM/LuaVM.hpp>
// bruh
int main()
{
    InitWindow(800,600,"Cross-Platform-Engine");
    SetTargetFPS(60);

    while (!WindowShouldClose())
    {
        BeginDrawing();
        ClearBackground(WHITE);

        EndDrawing();
    }


    CloseWindow();

    return 0;
}