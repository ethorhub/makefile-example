#include "hello/hello.hpp"
#include "operation/sum.hpp"
#include "hello.hpp"
#include "sum.hpp"
#include <iostream>

int main()
{
    std::cout << "SUM: " << sum(2, 3) << std::endl;
    helloworld();
    helloworldFromObject();
    int total = sumFunc();
    std::cout << "SUM FROM sumFunc: " << total << std::endl;
}