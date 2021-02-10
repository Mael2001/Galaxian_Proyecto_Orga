#include <iostream>
#include <easm.h>
#include <rlutil.h>

extern "C" ErrorCode handleSyscall(uint32_t *regs, void *mem, MemoryMap *mem_map)
{
    unsigned v0 = regs[Register::v0];

    switch (v0)
    {
    case 20:
    {
        int a0 = regs[Register::a0];
        int a1 = regs[Register::a1];
        regs[Register::v0] = a0 + a1;
        return ErrorCode::Ok;
    }
    //inge se vale solo usar los tests que ya vienen va
    case 21:
    {
        int a0 = regs[Register::a0];
        std::cout << "\nColor: " << a0 << std::endl;
        rlutil::setColor(a0);
        std::cout << a0 << " ";
        rlutil::resetColor();
        return ErrorCode::Ok;
    }
    case 22:
    {
        int a0 = regs[Register::a0];
        std::cout << "\nBackground color: " << a0 << std::endl;
        rlutil::setBackgroundColor(a0);
        std::cout << a0;
        rlutil::setBackgroundColor(0);
        std::cout << ' ';
        rlutil::resetColor();
        return ErrorCode::Ok;
    }
    case 23:
    {
        int x = regs[Register::a0];
        int y = regs[Register::a1];
        rlutil::cls();
        rlutil::CursorHider curs;
        std::cout << "Test 9: Arrow keys" << std::endl;
        std::cout << "You should be able to move the '@' character with arrow keys." << std::endl;
        std::cout << "Hit Escape to continue to the next test." << std::endl;
        gotoxy(x, y);
        std::cout << '@' << std::endl; // Output player
        while (true)
        {
            if (kbhit())
            {
                int k = rlutil::getkey(); // Get character
                gotoxy(x, y);
                std::cout << " "; // Erase player
                if (k == rlutil::KEY_LEFT)
                    --x;
                else if (k == rlutil::KEY_RIGHT)
                    ++x;
                else if (k == rlutil::KEY_UP)
                    --y;
                else if (k == rlutil::KEY_DOWN)
                    ++y;
                else if (k == rlutil::KEY_ESCAPE)
                    break;
                gotoxy(x, y);
                std::cout << '@'; // Output player
                std::cout.flush();
            }
        }
        return ErrorCode::Ok;
    }
    default:
        if (v0 > 20 && v0 <= 50)
        {
            std::cout << "Syscall: " << v0 << '\n'
                      << std::flush;
            return ErrorCode::Ok;
        }
        else
        {
            return ErrorCode::SyscallNotImplemented;
        }
    }
}