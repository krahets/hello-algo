/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{builtin_hash}
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "Хеш-значение целого числа " << num << " = " << hashNum << "\n";
    // Хеш-значение целого числа 3 = 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Хеш-значение булева значения " << bol << " = " << hashBol << "\n";
    // Хеш-значение булева значения 1 = 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Хеш-значение десятичного числа " << dec << " = " << hashDec << "\n";
    // Хеш-значение десятичного числа 3.14159 = 4614256650576692846

    string str = "Hello Algo";
    size_t hashStr = hash<string>()(str);
    cout << "Хеш-значение строки «" << str << "» = " << hashStr << "\n";
    // Хеш-значение строки «Hello Algo» = 15466937326284535026

    // В C++ встроенный std::hash() предоставляет вычисление хеша только для базовых типов данных
    // Вычисление хеша для массивов и объектов нужно реализовывать самостоятельно
    // [endregion]{builtin_hash}
}
