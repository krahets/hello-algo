/**
 * File: hanota.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 打印向量 */
void printVector(const vector<int>& vec) {
    cout << " [";
    for (size_t k = 0; k < vec.size(); ++k) {
        if (k > 0) cout << ", ";
        cout << vec[k];
    }
    cout << "]" << endl;
}

/* 移动一个圆盘：从 src 到 tar */
void move(vector<int>& src, vector<int>& tar) {
    int pan = src.back();
    src.pop_back();
    tar.push_back(pan);
}

/* 汉诺塔递归求解 */
void dfs(int i, vector<int>& src, vector<int>& buf, vector<int>& tar) {
    // 只剩一个圆盘，直接移动
    if (i == 1) {
        move(src, tar);
        return;
    }
    // 子问题 1：把 i-1 个从 src → buf（借助 tar）
    dfs(i - 1, src, tar, buf);
    // 把最底下 1 个从 src → tar
    move(src, tar);
    // 子问题 2：把 i-1 个从 buf → tar（借助 src）
    dfs(i - 1, buf, src, tar);
}

/* 汉诺塔入口函数 */
void solveHanota(vector<int>& A, vector<int>& B, vector<int>& C) {
    int n = A.size();
    dfs(n, A, B, C);
}

/* 主函数测试 */
int main() {
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B;
    vector<int> C;

    cout << "初始状态：" << endl;
    cout << "A ="; printVector(A);
    cout << "B ="; printVector(B);
    cout << "C ="; printVector(C);

    solveHanota(A, B, C);

    cout << "\n移动完成：" << endl;
    cout << "A ="; printVector(A);
    cout << "B ="; printVector(B);
    cout << "C ="; printVector(C);

    return 0;
}
