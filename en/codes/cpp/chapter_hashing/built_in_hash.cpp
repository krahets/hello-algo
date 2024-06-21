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
    cout << "The hash value of integer " << num << " is " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "The hash value of boolean " << bol << " is " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "The hash value of decimal " << dec << " is " << hashDec << "\n";

    string str = "Hello algorithm";
    size_t hashStr = hash<string>()(str);
    cout << "The hash value of string " << str << " is " << hashStr << "\n";

    // In C++, the built-in std:hash() only provides hash values for basic data types
    // Hash value calculation for arrays and objects must be implemented manually
}
