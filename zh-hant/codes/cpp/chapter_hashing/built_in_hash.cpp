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
    cout << "整數 " << num << " 的雜湊值為 " << hashNum << "\n";
    // 整數 3 的雜湊值為 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "布林量 " << bol << " 的雜湊值為 " << hashBol << "\n";
    // 布林量 1 的雜湊值為 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "小數 " << dec << " 的雜湊值為 " << hashDec << "\n";
    // 小數 3.14159 的雜湊值為 4614256650576692846

    string str = "Hello 演算法";
    size_t hashStr = hash<string>()(str);
    cout << "字串“" << str << "”的雜湊值為 " << hashStr << "\n";
    // 字串“Hello 演算法”的雜湊值為 15466937326284535026

    // 在 C++ 中，內建 std::hash() 僅提供基本資料型別的雜湊值計算
    // 陣列、物件的雜湊值計算需要自行實現
    // [endregion]{builtin_hash}
}
