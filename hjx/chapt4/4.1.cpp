#include <iostream>

using namespace std;

int main(int argc, char* argv[])
{
    int* arr1 = new int[5];
    int* nums = new int[5] { 1, 2, 3, 4, 5 };
    // for (int i = 0; i < (sizeof(arr1) / sizeof(arr1[0])); i++) {
    //     std::cout << "arr1[" << i << "]:" << arr1[i] << ",";
    // }
    // std::cout << std::endl;

    // for (int i = 0; i < (5); i++) {
    //     std::cout << "nums[" << i << "]:" << nums[i] << ",";
    // }
    std::cout << std::endl;
    delete[] arr1;
    delete[] nums;
    return 0;
}