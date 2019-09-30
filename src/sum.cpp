#include "operation/sum.hpp"
#include <iostream>
using namespace std;
int sumFunc()
{
    int x, y;
    cout << "Enter x number: ";
    cin >> x;
    cout << "Enter y number: ";
    cin >> y;
    return sum(x, y);
}