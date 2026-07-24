/**
 * File: iteration.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <string>
#include <sstream>
using namespace std;

/* for 循环 */
int forLoop(int n) {
    int res = 0;
    // 循环求和 1 + 2 + ... + n
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* while 循环 */
int whileLoop(int n) {
    int res = 0;
    int i = 1;
    // 循环求和 1 + 2 + ... + n
    while (i <= n) {
        res += i;
        i++;
    }
    return res;
}

/* while 循环（两次更新） */
int whileLoopII(int n) {
    int res = 0;
    int i = 1;
    // 按特殊规则更新变量
    while (i <= n) {
        res += i;
        i++;
        i *= 2;
    }
    return res;
}

/* 双层 for 循环 */
string nestedForLoop(int n) {
    ostringstream res;
    // 遍历 i = 1, 2, ..., n
    for (int i = 1; i <= n; ++i) {
        // 遍历 j = 1, 2, ..., n
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* Driver Code */
int main() {
    int n = 5;

    // for 循环
    int res = forLoop(n);
    cout << "\nfor 循环求和结果：res = " << res << endl;

    // while 循环
    res = whileLoop(n);
    cout << "\nwhile 循环求和结果：res = " << res << endl;

    // while 循环（两次更新）
    res = whileLoopII(n);
    cout << "\nwhile 循环（两次更新）求和结果：res = " << res << endl;

    // 双层 for 循环
    string resStr = nestedForLoop(n);
    cout << "\n双层 for 循环遍历结果：" << resStr << endl;

    return 0;
}
