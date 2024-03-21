/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 移動一個圓盤 */
void move(vector<int> &src, vector<int> &tar) {
    // 從 src 頂部拿出一個圓盤
    int pan = src.back();
    src.pop_back();
    // 將圓盤放入 tar 頂部
    tar.push_back(pan);
}

/* 求解河內塔問題 f(i) */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
    // 若 src 只剩下一個圓盤，則直接將其移到 tar
    if (i == 1) {
        move(src, tar);
        return;
    }
    // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
    dfs(i - 1, src, tar, buf);
    // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
    move(src, tar);
    // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
    dfs(i - 1, buf, src, tar);
}

/* 求解河內塔問題 */
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // 將 A 頂部 n 個圓盤藉助 B 移到 C
    dfs(n, A, B, C);
}

/* Driver Code */
int main() {
    // 串列尾部是柱子頂部
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B = {};
    vector<int> C = {};

    cout << "初始狀態下：\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    solveHanota(A, B, C);

    cout << "圓盤移動完成後：\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}
