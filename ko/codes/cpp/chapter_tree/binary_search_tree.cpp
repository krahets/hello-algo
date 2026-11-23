/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 이진 탐색 트리 */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    /* 생성자 */
    BinarySearchTree() {
        // 빈 트리를 초기화한다
        root = nullptr;
    }

    /* 소멸자 */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* 이진 트리의 루트 노드 반환 */
    TreeNode *getRoot() {
        return root;
    }

    /* 노드 탐색 */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while (cur != nullptr) {
            // 목표 노드는 cur의 오른쪽 서브트리에 있다
            if (cur->val < num)
                cur = cur->right;
            // 목표 노드는 cur의 왼쪽 서브트리에 있다
            else if (cur->val > num)
                cur = cur->left;
            // 목표 노드를 찾았으므로 반복문을 종료한다
            else
                break;
        }
        // 목표 노드를 반환한다
        return cur;
    }

    /* 노드 삽입 */
    void insert(int num) {
        // 트리가 비어 있으면 루트 노드를 초기화한다
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while (cur != nullptr) {
            // 중복 노드를 찾으면 바로 반환한다
            if (cur->val == num)
                return;
            pre = cur;
            // 삽입 위치는 cur의 오른쪽 서브트리에 있다
            if (cur->val < num)
                cur = cur->right;
            // 삽입 위치는 cur의 왼쪽 서브트리에 있다
            else
                cur = cur->left;
        }
        // 노드 삽입
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* 노드 삭제 */
    void remove(int num) {
        // 트리가 비어 있으면 바로 반환하여 종료한다
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while (cur != nullptr) {
            // 삭제할 노드를 찾았으므로 반복문을 종료한다
            if (cur->val == num)
                break;
            pre = cur;
            // 삭제할 노드는 cur의 오른쪽 서브트리에 있다
            if (cur->val < num)
                cur = cur->right;
            // 삭제할 노드는 cur의 왼쪽 서브트리에 있다
            else
                cur = cur->left;
        }
        // 삭제할 노드가 없으면 바로 반환한다
        if (cur == nullptr)
            return;
        // 자식 노드 수 = 0 또는 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 자식 노드 수가 0 / 1이면 child = nullptr / 해당 자식 노드다
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // 노드 cur를 삭제한다
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 삭제할 노드가 루트 노드이면 루트 노드를 다시 지정한다
                root = child;
            }
            // 메모리 해제
            delete cur;
        }
        // 자식 노드 수 = 2
        else {
            // 중위 순회에서 cur의 다음 노드를 구한다
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // 노드 tmp를 재귀적으로 삭제한다
            remove(tmp->val);
            // tmp로 cur를 덮어쓴다
            cur->val = tmpVal;
        }
    }
};

/* 실행 코드 */
int main() {
    /* 이진 탐색 트리 초기화 */
    BinarySearchTree *bst = new BinarySearchTree();
    // 삽입 순서에 따라 서로 다른 이진 트리가 생성된다. 이 순서는 포화 이진 트리를 생성할 수 있다
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "초기화한 이진 트리:\n" << endl;
    printTree(bst->getRoot());

    /* 노드 탐색 */
    TreeNode *node = bst->search(7);
    cout << endl << "찾은 노드 객체: " << node << ", 노드 값 = " << node->val << endl;

    /* 노드 삽입 */
    bst->insert(16);
    cout << endl << "노드 16 삽입 후 이진 트리:\n" << endl;
    printTree(bst->getRoot());

    /* 노드 삭제 */
    bst->remove(1);
    cout << endl << "노드 1 삭제 후 이진 트리:\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "노드 2 삭제 후 이진 트리:\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "노드 4 삭제 후 이진 트리:\n" << endl;
    printTree(bst->getRoot());

    // 메모리 해제
    delete bst;

    return 0;
}
