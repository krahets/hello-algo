/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 円盤を移動 */
void move(vector<int> &src, vector<int> &tar) {
    // src の最上部から円盤を取り出す
    int pan = src.back();
    src.pop_back();
    // 円盤を tar の最上部に配置
    tar.push_back(pan);
}

/* ハノイの塔問題 f(i) を解く */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
    // src に円盤が1つだけ残っている場合、それを tar に移動
    if (i == 1) {
        move(src, tar);
        return;
    }
    // 部分問題 f(i-1)：tar の助けを借りて、上位 i-1 個の円盤を src から buf に移動
    dfs(i - 1, src, tar, buf);
    // 部分問題 f(1)：残りの1つの円盤を src から tar に移動
    move(src, tar);
    // 部分問題 f(i-1)：src の助けを借りて、上位 i-1 個の円盤を buf から tar に移動
    dfs(i - 1, buf, src, tar);
}

/* ハノイの塔問題を解く */
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // B の助けを借りて、上位 n 個の円盤を A から C に移動
    dfs(n, A, B, C);
}

/* ドライバーコード */
int main() {
    // リストの末尾が柱の最上部
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B = {};
    vector<int> C = {};

    cout << "初期状態:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    solveHanota(A, B, C);

    cout << "円盤移動後:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}