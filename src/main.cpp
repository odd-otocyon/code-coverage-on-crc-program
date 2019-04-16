#include "processing.h"
#include <iostream>
#include <fstream>

using namespace std;

int main(int argc, char* argv[])
{
	string filepath{ "C:/Users/mspilmont/Code/CPP/test.txt" };

	if (argc > 1)
	{
		filepath = argv[1];
	}

	ifstream infile(filepath);
	if (infile)
	{
		cout << "L'ouverture du fichier c'est effectu�e avec succes" << endl;
	}
	else
	{
		cout << "Erreur : impossible d'ouvrir le fichier " << filepath << endl;
		return 1;
	}

	Processing processing(false);
	char c;
	while (infile.get(c))
	{
		processing.calculator(c);
	}

	cout << "CRC = " << processing.getRemain() << endl;

	system("PAUSE");
	return 0;
}
