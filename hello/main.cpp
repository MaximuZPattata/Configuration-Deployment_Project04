#include <iostream>
#include <fstream>
#include <string>

int main()
{
	std::string readLine;

	std::ifstream fileRead("hello.txt");

    if (!fileRead.is_open()) 
    {
        std::cerr << "Error opening the file!\n" << std::endl;
        return 1;
    }

    while (std::getline(fileRead, readLine))
        std::cout << readLine << std::endl;

    fileRead.close();

	std::cout << std::endl << std::endl;
	std::cout << "Press 'Enter' to close the program\n" << std::endl;

    getchar();

	return 0;
}