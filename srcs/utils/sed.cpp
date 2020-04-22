#include <iostream>
#include <string>
#include <cctype>
#include <cstdlib>
#include <cstdio>
#include <fstream>

int ft_strlen(char *s)
{
	int i;

	for (i = 0; s[i] != '\0'; i++)
		i++;
	std::cout << i << std::endl;
	return (i);
}

int main(int ac, char **av)
{
	std::string b = "";
	std::string content = "";
	int i = 0;
	std::string b_s(av[2]);
	int len = b_s.size();

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
	std::cout << av[2] << std::endl << av[3] << std::endl << len <<
	std::endl;
	while (i < content.size())
	{
		i = content.find(av[2], i);
		if (i < content.size())
		{
			content.replace(i, len, av[3]);
//			i += ft_strlen(av[3]);
		}
	}
	//std::cout << content << std::endl;
	dest << content;
	return (0);
}
