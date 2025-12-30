/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "Hash value of integer " << num << " is " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Hash value of boolean " << bol << " is " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Hash value of decimal " << dec << " is " << hashDec << "\n";

    string str = "Hello Algo";
    size_t hashStr = hash<string>()(str);
    cout << "Hash value of string " << str << " is " << hashStr << "\n";

    // In C++, built-in std::hash() only provides hash calculation for basic data types
    // Hash calculation for arrays and objects needs to be implemented manually
}
