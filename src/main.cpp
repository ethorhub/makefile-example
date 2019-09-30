#include "hello/hello.hpp"
#include "operation/sum.hpp"
#include "hello.hpp"
#include <iostream>

int main()
{
    std::cout << "SUM: " << sum(2, 3) << std::endl;
    helloworld();
    helloworldFromObject();
}