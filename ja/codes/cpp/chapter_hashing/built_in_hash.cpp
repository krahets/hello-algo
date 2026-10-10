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
    cout << "整数 " << num << " のハッシュ値は " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "真偽値 " << bol << " のハッシュ値は " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "小数 " << dec << " のハッシュ値は " << hashDec << "\n";

    string str = "Hello アルゴリズム";
    size_t hashStr = hash<string>()(str);
    cout << "文字列 " << str << " のハッシュ値は " << hashStr << "\n";

    // C++ では、組み込みの std::hash() は基本データ型のハッシュ値計算しか提供しない
    // 配列やオブジェクトのハッシュ値計算は自分で実装する必要がある
}
