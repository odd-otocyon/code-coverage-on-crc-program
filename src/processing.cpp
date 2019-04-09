#include "processing.h"
#include <iostream>
using namespace std;

Processing::Processing(bool _display) : m_divisor('a')
{
	m_display = _display;
	m_nbCalc = 0;
}

Processing::~Processing()
{
}

bitset<8> Processing::getRemain() const
{
	return m_remain;
}

void Processing::calculator(char _c)
{
	if (m_nbCalc > 0)
	{
		bitset<8> b(_c);
		for (int i = 7 ; i > 0 ; i--)
		{
			remainXorDivisor();
			shiftRemain(b[i]);
		}
	}
	else
	{
		m_remain = _c;
	}
	m_nbCalc++;

	if (m_display)
	{
		cout << "Calcule " << m_nbCalc << " = " << m_remain << endl;
	}
}

bitset<8> Processing::multiplyDivisor() const
{
	if (m_remain[7] == 1)
	{
		return bitset<8>(m_divisor);
	}
	return bitset<8>("00000000");
}

void Processing::shiftRemain(int bit)
{
	m_remain <<= 1;
	m_remain[0] = bit;
}

void Processing::remainXorDivisor()
{
	if (m_display)
	{
		cout << "###### XOR ######" << endl
			<< "  " << m_remain << endl
			<< "  " << multiplyDivisor() << endl;
	}
	
	m_remain ^= multiplyDivisor();

	if (m_display)
	{
		cout << "= " << m_remain << endl;
	}
}

void Processing::test() const
{
	bitset<8> a("11110000");
	for (int i = 7; i > 0; i--)
	{
		cout << a[i];
	}
	cout << endl;
}
