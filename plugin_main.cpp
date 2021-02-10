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
    case 21:
    {
        std::cout << "\nTest 1: Colors" << std::endl;
        for (int i = 0; i < 16; i++)
        {
            rlutil::setColor(i);
            std::cout << i << " ";
        }
        rlutil::resetColor();
        std::cout << std::endl
                  << "You should see numbers 0-15 in different colors." << std::endl;
        return ErrorCode::Ok;
    }
    case 22:
    {
        std::cout << "\nTest 2: Background colors\n";
        for (int i = 0; i < 8; i++)
        {
            rlutil::setBackgroundColor(i);
            std::cout << i;
            rlutil::setBackgroundColor(0);
            std::cout << ' ';
        }
        rlutil::resetColor();
        std::cout << "\nYou should see numbers 0-7 in different-colored backgrounds.\n";
        return ErrorCode::Ok;
    }
    case 23:
    {
        int x = 7;
        int y = 7;
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