#include "hello.hpp"
#include "operation/sum.hpp"
#include <iostream>

int main()
{
    std::cout << "SUM: " << sum(2, 3) << std::endl;
    helloworld();
}