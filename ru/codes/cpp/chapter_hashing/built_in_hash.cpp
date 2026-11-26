/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Демонстрационный код */
int main() {
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "Целое число " << num << " имеет хеш " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "Логическое значение " << bol << " имеет хеш " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "Вещественное число " << dec << " имеет хеш " << hashDec << "\n";

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "Строка " << str << " имеет хеш " << hashStr << "\n";

    // В C++ встроенный шаблон std::hash() вычисляет хеши только для базовых типов и некоторых типов стандартной библиотеки (например, std::string)
    // Для массивов и объектов вычисление хеша нужно реализовать самостоятельно
}
