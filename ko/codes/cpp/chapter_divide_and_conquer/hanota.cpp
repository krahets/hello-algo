/**
 * File: hanota.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 원판 하나 이동 */
void move(vector<int> &src, vector<int> &tar) {
    // src의 맨 위에서 원판 하나를 꺼낸다
    int pan = src.back();
    src.pop_back();
    // 원판을 tar의 맨 위에 놓는다
    tar.push_back(pan);
}

/* 하노이의 탑 문제 f(i) 풀기 */
void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
    // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
    if (i == 1) {
        move(src, tar);
        return;
    }
    // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
    dfs(i - 1, src, tar, buf);
    // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move(src, tar);
    // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
    dfs(i - 1, buf, src, tar);
}

/* 하노이의 탑 문제 풀기 */
void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
    int n = A.size();
    // B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
    dfs(n, A, B, C);
}

/* 실행 코드 */
int main() {
    // 리스트의 맨 뒤가 기둥의 맨 위이다
    vector<int> A = {5, 4, 3, 2, 1};
    vector<int> B = {};
    vector<int> C = {};

    cout << "초기 상태:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    solveHanota(A, B, C);

    cout << "원판 이동을 마친 후:\n";
    cout << "A =";
    printVector(A);
    cout << "B =";
    printVector(B);
    cout << "C =";
    printVector(C);

    return 0;
}
