#include <iostream>
#include <random>
#include <time.h>

void insert(int *numbers, int *leftTrees, int *rightTrees, int i, int size){
    int j = 0;
    while(j < size){
        if(numbers[i] < numbers[j]){
            if(leftTrees[j] == 0 ){
               leftTrees[j] = i;
               return;
            }  
            j = leftTrees[j];
            continue;
        }
       
        if(numbers[i] >= numbers[j]){
            if(rightTrees[j] == 0){
                rightTrees[j] = i;
                return;
            }   
            j = rightTrees[j];
            continue;
        }
        j++;
    }
}

int getrandomnumber(int min, int max) {
    return rand() % (max- min + 1) + min;
}

void createList(int * numbers, int size){
    for(int i = 0; i < size; i++){
        numbers[i] = getrandomnumber(50, size);
    }
}

void printList(int * numbers, int size){
    for(int i = 0; i < size; i++){
        std::cout << numbers[i] << std::endl;
    }
}

void initializeList(int * list, int size){
     for(int i = 0; i < size; i++){
        list[i] = 0;
     }
}

int main(int argc, char** argv){

    int size = 1000;
    if(argc > 1){
        size = std::atoi(argv[1]);
    }

    srand(400);
    int * leftTrees = new int[size];
    int * rightTrees= new int[size];
    int * numbers= new int[size];

    initializeList(leftTrees, size);
    initializeList(rightTrees, size);
    initializeList(numbers, size);

    createList(numbers, size);

    // numbers and roots is the same thing
    for(int i = 1; i < size; i++){
        insert(numbers,leftTrees, rightTrees, i, size);
    }

    delete[] leftTrees;
    delete[] rightTrees;
    delete[] numbers;
    return 0;
}
