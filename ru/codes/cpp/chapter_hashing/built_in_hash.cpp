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
    cout << "Хеш-значение целого числа " << num << " = " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Хеш-значение булева значения " << bol << " = " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Хеш-значение десятичного числа " << dec << " = " << hashDec << "\n";

    string str = "Hello Algo";
    size_t hashStr = hash<string>()(str);
    cout << "Хеш-значение строки " << str << " = " << hashStr << "\n";

    // В C++ встроенный std::hash() предоставляет вычисление хеша только для базовых типов данных
    // Вычисление хеша для массивов и объектов нужно реализовывать самостоятельно
}
