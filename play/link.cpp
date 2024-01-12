#include <iostream>

int main(){

    int size = 10;
    int setA[10] = {0,1,2,3,4,5,6,7,9};
    int * setB = new int[size];

    std::cout <<(int*) setA << std::endl;
    

    return 0;
}
