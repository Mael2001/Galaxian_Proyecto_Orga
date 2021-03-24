#include <iostream>
#include <easm.h>
#include <rlutil.h>
#include <fstream>
#include <string>

std::string getFileContents(std::ifstream &);

std::string getFileContents(std::ifstream &File)
{
    std::string Lines = ""; //All lines

    if (File) //Check if everything is good
    {
        while (File.good())
        {
            std::string TempLine;         //Temp line
            std::getline(File, TempLine); //Get temp line
            TempLine += "\n";             //Add newline character

            Lines += TempLine; //Add newline
        }
        return Lines;
    }
    else //Return error
    {
        return "ERROR File does not exist.";
    }
}
extern "C" ErrorCode handleSyscall(uint32_t *regs, void *mem, MemoryMap *mem_map)
{
    unsigned v0 = regs[Register::v0];

    switch (v0)
    {
    case 20:
    {
        rlutil::cls();
        return ErrorCode::Ok;

        break;
    }
    //inge se vale solo usar los tests que ya vienen va
    case 21:
    {
        int texto = regs[Register::s1];
        int stages = regs[Register::s4];
        int lives = regs[Register::s3];

        if (texto == 1)
        {
            std::ifstream Reader("Titulo.txt"); //Open file

            std::string Art = getFileContents(Reader); //Get file

            std::cout << Art << std::endl; //Print it to the screen

            Reader.close(); //Close file
        }
        else if (texto == 2)
        {
            std::ifstream Reader("Menu.txt"); //Open file

            std::string Art = getFileContents(Reader); //Get file

            std::cout << Art << std::endl; //Print it to the screen

            Reader.close(); //Close file
        }
        else if (texto == 3)
        {
            std::ifstream Reader("Jugar.txt"); //Open file

            std::string Art = getFileContents(Reader); //Get file

            std::cout << Art; //Print it to the screen

            Reader.close(); //Close file
        }
        else if (texto == 4)
        {
            std::ifstream Reader("Salir.txt"); //Open file

            std::string Art = getFileContents(Reader); //Get file

            std::cout << Art; //Print it to the screen

            Reader.close(); //Close file
        }
        else if (texto == 5)
        {
            std::ifstream Reader("enemigo.txt"); //Open file

            std::string Art = getFileContents(Reader); //Get file

            std::cout << Art; //Print it to the screen

            Reader.close(); //Close file
        }
        else if (texto == 6)
        {
            std::ifstream Reader("score.txt"); //Open file

            std::string Art = getFileContents(Reader); //Get file

            std::cout << Art; //Print it to the screen

            Reader.close(); //Close file
        }
        else if (texto == 7)
        {
            switch (lives)
            {
            case 1:
                std::cout << "/\\ ";
                break;
            case 2:
                std::cout << "/\\ /\\ ";
                break;
            case 3:
                std::cout << "/\\ /\\ /\\ ";
                break;
            default:
                std::cout << "/\\ /\\ /\\ /\\ ";
                break;
            }
        }
        else if (texto == 8)
        {
            std::cout << "Stage: " << stages;
        }
        else if (texto == 9)
        {
            std::cout << "/\\";
        }
        else if (texto == 10)
        {
            std::cout << "  ";
        }

        return ErrorCode::Ok;

        break;
    }
    case 22:
    {
        int a1 = regs[Register::a0];
        int a0 = regs[Register::a1];
        gotoxy(a0, a1);

        return ErrorCode::Ok;

        break;
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
    case 24:
    {
        rlutil::CursorHider curs;
        return ErrorCode::Ok;
    }
    case 25:
    {
        int hit = kbhit();
        regs[Register::v0] = hit;
        return ErrorCode::Ok;
    }
    case 26:
    {
        int k = rlutil::getkey(); // Get character
        if (k == rlutil::KEY_LEFT)
            regs[Register::v0] = 0;
        else if (k == rlutil::KEY_RIGHT)
            regs[Register::v0] = 1;
        else if (k == rlutil::KEY_ESCAPE)
            break;
        return ErrorCode::Ok;
    }
    default:
        if (v0 > 20 && v0 <= 252)
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
    return ErrorCode::Ok;
}