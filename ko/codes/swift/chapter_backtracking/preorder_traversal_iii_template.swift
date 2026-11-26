/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 현재 상태가 해인지 확인한다 */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* 해를 기록한다 */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* 현재 상태에서 이 선택이 유효한지 확인한다 */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* 상태를 갱신한다 */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* 상태를 복원한다 */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* 백트래킹: 예제 3 */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // 해인지 확인한다
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // 모든 선택지를 순회한다
    for choice in choices {
        // 가지치기: 선택이 유효한지 확인한다
        if isValid(state: state, choice: choice) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(state: &state, choice: choice)
            // 다음 선택을 진행한다
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* 실행 코드 */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\n이진 트리 초기화")
        PrintUtil.printTree(root: root)

        // 백트래킹 알고리즘
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\n루트에서 값이 7인 노드까지 값이 3인 노드를 거치지 않는 모든 경로 출력")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
