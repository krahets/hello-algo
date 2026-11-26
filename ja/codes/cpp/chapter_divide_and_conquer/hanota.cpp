/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 円盤を 1 枚移す */
void move(vector<int> &src, vector<int> &tar) {
    // src の一番上から円盤を 1 枚取り出す
    int pan = src.back();
    src.pop_back();
    // 円盤を tar の一番上に置く
    tar.push_back(pan);
}

/* ハノイの塔の問題 f(i) を解く */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
    // src の円盤が残り 1 枚なら、そのまま tar に移す
    if (i == 1) {
        move(src, tar);
        return;
    }
    // 部分問題 f(i-1)：src の上から i-1 枚を tar を使って buf に移す
    dfs(i - 1, src, tar, buf);
    // 部分問題 f(1)：src に残った 1 枚を tar に移す
    move(src, tar);
    // 部分問題 f(i-1)：buf の上から i-1 枚を src を使って tar に移す
    dfs(i - 1, buf, src, tar);
}

/* ハノイの塔を解く */
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // A の上から n 枚の円盤を B を使って C に移す
    dfs(n, A, B, C);
}

/* 実行例 */
int main() {
    // リストの末尾が棒の一番上に対応する
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

    cout << "円盤をすべて移した後：\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}
