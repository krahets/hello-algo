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
    cout << "Integer " << num << " has hash value " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Boolean " << bol << " has hash value " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Decimal " << dec << " has hash value " << hashDec << "\n";

    string str = "Hello Algo";
    size_t hashStr = hash<string>()(str);
    cout << "String " << str << " has hash value " << hashStr << "\n";

    // In C++, built-in std::hash() only provides hash calculation for basic data types
    // Hash calculation for arrays and objects needs to be implemented manually
}
