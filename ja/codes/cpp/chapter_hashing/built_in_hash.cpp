/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    // [region]{builtin_hash}
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "整数 " << num << " のハッシュ値は " << hashNum << "\n";
    // 整数 3 のハッシュ値は 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "真偽値 " << bol << " のハッシュ値は " << hashBol << "\n";
    // 真偽値 1 のハッシュ値は 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "小数 " << dec << " のハッシュ値は " << hashDec << "\n";
    // 小数 3.14159 のハッシュ値は 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "文字列「" << str << "」のハッシュ値は " << hashStr << "\n";
    // 文字列「Hello 算法」のハッシュ値は 15466937326284535026

    // C++ の組み込み std::hash() は、基本データ型のハッシュ値の計算にのみ対応する
    // 配列やオブジェクトのハッシュ値の計算は自分で実装する必要がある
    // [endregion]{builtin_hash}
}
