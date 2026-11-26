/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 実行例 */
int main() {
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "整数 " << num << " のハッシュ値は " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "真偽値 " << bol << " のハッシュ値は " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "浮動小数点数 " << dec << " のハッシュ値は " << hashDec << "\n";

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "文字列 " << str << " のハッシュ値は " << hashStr << "\n";

    // C++ の標準の std::hash() でハッシュ値を計算できるのは、基本型と一部の標準ライブラリの型（std::string など）に限られる
    // 配列やオブジェクトのハッシュ値の計算は自分で実装する必要がある
}
