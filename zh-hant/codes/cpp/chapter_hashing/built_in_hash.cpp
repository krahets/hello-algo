/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 主程式 */
int main() {
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "整數 " << num << " 的雜湊值為 " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "布林值 " << bol << " 的雜湊值為 " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "小數 " << dec << " 的雜湊值為 " << hashDec << "\n";

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "字串 " << str << " 的雜湊值為 " << hashStr << "\n";

    // 在 C++ 中，內建的 std::hash() 只支援基本資料型別與部分標準函式庫型別（例如 std::string）的雜湊值計算
    // 若要計算陣列與物件的雜湊值，必須自行實作
}
