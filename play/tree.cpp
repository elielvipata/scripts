#include <iostream>
#include <cstdlib>
#include <memory>
#include <random>
#include <time.h>

struct Node{
    int number;
    std::unique_ptr<Node> left;
    std::unique_ptr<Node> right;
};

std::unique_ptr<Node> initialize(int num){
    std::unique_ptr<Node> newNode = std::make_unique<Node>();
    newNode->number = num;
    newNode->left = nullptr;
    newNode->right = nullptr;
    return newNode;
}

void insert(std::unique_ptr<Node>& root, int value){
    if(root == nullptr){
        root = initialize(value);
        return;
    }

    if(value < root->number){
        insert(root->left, value);
    }

    if(value >= root->number){
        insert(root->right, value);
    }
}

void inorderPrint(std::unique_ptr<Node>& root){
    if(root == nullptr){
        return;
    }
    std::cout << root->number << std::endl;
    inorderPrint(root->left);
    inorderPrint(root->right);
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

int main(int argc, char ** argv){
    int size = 1000;
    if(argc > 1){
        size = std::atoi(argv[1]);
    }
    std::unique_ptr<Node> root = nullptr;
    srand(400);
    int* numbers = new int[size];
    initializeList(numbers, size);

    unsigned int seed = 400;
    createList(numbers, size);
    for(int i = 0; i < size; i++){
        insert(root, numbers[i]);
    }

    delete[] numbers;

    return 0;
}
