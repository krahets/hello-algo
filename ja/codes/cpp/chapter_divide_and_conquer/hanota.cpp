/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 円盤を 1 枚移動 */
void move(vector<int> &src, vector<int> &tar) {
    // src の上から円盤を1枚取り出す
    int pan = src.back();
    src.pop_back();
    // 円盤を tar の上に置く
    tar.push_back(pan);
}

/* ハノイの塔の問題 f(i) を解く */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
    // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
    if (i == 1) {
        move(src, tar);
        return;
    }
    // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
    dfs(i - 1, src, tar, buf);
    // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
    move(src, tar);
    // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
    dfs(i - 1, buf, src, tar);
}

/* ハノイの塔を解く */
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // A の上から n 枚の円盤を B を介して C へ移す
    dfs(n, A, B, C);
}

/* Driver Code */
int main() {
    // リスト末尾が柱の頂上
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B = {};
    vector<int> C = {};

    cout << "初期状態：\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    solveHanota(A, B, C);

    cout << "円盤の移動完了後：\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}
