/**
 * File: space_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 함수 */
int func() {
    // 몇 가지 연산을 수행한다
    return 0;
}

/* 상수 차수 */
void constant(int n) {
    // 상수, 변수, 객체는 O(1) 공간을 차지한다
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // 반복문 안의 변수는 O(1) 공간을 차지한다
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // 반복문 안의 함수는 O(1) 공간을 차지한다
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 선형 차수 */
void linear(int n) {
    // 길이가 n인 배열은 O(n) 공간을 차지한다
    vector<int> nums(n);
    // 길이가 n인 리스트는 O(n) 공간을 차지한다
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* 선형 차수(재귀 구현) */
void linearRecur(int n) {
    cout << "재귀 n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 제곱 차수 */
void quadratic(int n) {
    // 이차원 리스트는 O(n^2) 공간을 차지한다
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* 제곱 차수(재귀 구현) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "재귀 n = " << n << " 일 때 nums의 길이 = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* 지수 차수(포화 이진 트리 구성) */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* 실행 코드 */
int main() {
    int n = 5;
    // 상수 차수
    constant(n);
    // 선형 차수
    linear(n);
    linearRecur(n);
    // 제곱 차수
    quadratic(n);
    quadraticRecur(n);
    // 지수 차수
    TreeNode *root = buildTree(n);
    printTree(root);

    // 메모리 해제
    freeMemoryTree(root);

    return 0;
}
