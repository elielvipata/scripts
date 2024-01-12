#include <iostream>
#include <utility>
#include <vector>
using namespace std;

int main(){

    vector<pair<int, int>> int_pairs;
    int_pairs.push_back(1,1);
    cout << int_pairs[0].first << endl;

    return 0;
}
