#include <iostream>
#include <string>
#include <cctype>
#include <cstdlib>
#include <cstdio>
#include <fstream>

int main(int ac, char **av)
{
	std::string b = "";
	std::string content = "";
	int i(0);

	if (ac != 4)
		return (0);
	std::ifstream src(av[1]);
	if (!src)
		return (0);
	while (std::getline(src, b))
		content.append(b + "\n");
	if (content == "")
		return (0);
	std::ofstream dest(av[1]);
	if (!dest)
		return (0);
	while (i < content.size())
	{
		i = content.find(av[2], i);
		if (i < content.npos)
		{
			content.replace(i, strlen(av[2]), av[3]);
			i += strlen(av[3]);
		}
	}
	//std::cout << content << std::endl;
	dest << content;
	return (0);
}
