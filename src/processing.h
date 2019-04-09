#pragma once
#include <bitset>
#include <fstream>

class Processing
{
public:
	Processing(bool _display);
	~Processing();
	std::bitset<8> getRemain() const;
	void calculator(char _c);
	void test() const;
private:
	const std::bitset<8> m_divisor;
	bool m_display;
	int m_nbCalc;
	std::bitset<8> m_remain;
	std::bitset<8> multiplyDivisor() const;
	void shiftRemain(int);
	void remainXorDivisor();
};
