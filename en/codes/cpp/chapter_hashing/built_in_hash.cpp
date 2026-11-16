/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    // [region]{builtin_hash}
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "Integer " << num << " has hash value " << hashNum << "\n";
    // Integer 3 has hash value 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Boolean " << bol << " has hash value " << hashBol << "\n";
    // Boolean 1 has hash value 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Floating-point number " << dec << " has hash value " << hashDec << "\n";
    // Floating-point number 3.14159 has hash value 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "String '" << str << "' has hash value " << hashStr << "\n";
    // String 'Hello 算法' has hash value 15466937326284535026

    // C++ std::hash provides hashing for fundamental types and selected standard-library types
    // For arrays and unsupported object types, supply your own hash implementation
    // [endregion]{builtin_hash}
}
