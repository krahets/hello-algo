/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 배열로 표현한 이진 트리 클래스 */
class ArrayBinaryTree {
  public:
    /* 생성자 */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* 리스트 용량 */
    int size() {
        return tree.size();
    }

    /* 인덱스가 i인 노드의 값 반환 */
    int val(int i) {
        // 인덱스가 범위를 벗어나면 빈자리를 나타내는 INT_MAX를 반환한다
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* 레벨 순서 순회 */
    vector<int> levelOrder() {
        vector<int> res;
        // 배열을 직접 순회한다
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* 전위 순회 */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* 중위 순회 */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* 후위 순회 */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* 깊이 우선 순회 */
    void dfs(int i, string order, vector<int> &res) {
        // 빈칸이면 반환한다
        if (val(i) == INT_MAX)
            return;
        // 전위 순회
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // 중위 순회
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // 후위 순회
        if (order == "post")
            res.push_back(val(i));
    }
};

/* 실행 코드 */
int main() {
    // 이진 트리 초기화
    // INT_MAX로 빈자리 nullptr를 나타낸다
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\n이진 트리 초기화\n";
    cout << "이진 트리의 배열 표현:\n";
    printVector(arr);
    cout << "이진 트리의 연결 리스트 표현:\n";
    printTree(root);

    // 배열로 표현한 이진 트리 클래스
    ArrayBinaryTree abt(arr);

    // 노드 접근
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\n현재 노드의 인덱스: " << i << ", 값: " << abt.val(i) << "\n";
    cout << "왼쪽 자식 노드의 인덱스: " << l << ", 값: " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "오른쪽 자식 노드의 인덱스: " << r << ", 값: " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "부모 노드의 인덱스: " << p << ", 값: " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // 트리 순회
    vector<int> res = abt.levelOrder();
    cout << "\n레벨 순서 순회: ";
    printVector(res);
    res = abt.preOrder();
    cout << "전위 순회: ";
    printVector(res);
    res = abt.inOrder();
    cout << "중위 순회: ";
    printVector(res);
    res = abt.postOrder();
    cout << "후위 순회: ";
    printVector(res);

    return 0;
}
