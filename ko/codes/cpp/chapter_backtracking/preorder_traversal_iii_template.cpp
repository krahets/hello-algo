/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 현재 상태가 해인지 확인한다 */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* 해를 기록한다 */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* 현재 상태에서 이 선택이 유효한지 확인한다 */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* 상태를 갱신한다 */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* 상태를 복원한다 */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* 백트래킹: 예제 3 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // 해인지 확인한다
    if (isSolution(state)) {
        // 해를 기록한다
        recordSolution(state, res);
    }
    // 모든 선택지를 순회한다
    for (TreeNode *choice : choices) {
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(state, choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state, choice);
            // 다음 선택을 진행한다
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state, choice);
        }
    }
}

/* 실행 코드 */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n이진 트리 초기화" << endl;
    printTree(root);

    // 백트래킹 알고리즘
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\n루트에서 값이 7인 노드까지 값이 3인 노드를 거치지 않는 모든 경로 출력" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
