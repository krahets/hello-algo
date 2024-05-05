/**
 * File: preorder_traversal_iii_template.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Determine if the current state is a solution */
func isSolution(state: [TreeNode]) -> Bool {
    !state.isEmpty && state.last!.val == 7
}

/* Record solution */
func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
    res.append(state)
}

/* Determine if the choice is legal under the current state */
func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
    choice != nil && choice!.val != 3
}

/* Update state */
func makeChoice(state: inout [TreeNode], choice: TreeNode) {
    state.append(choice)
}

/* Restore state */
func undoChoice(state: inout [TreeNode], choice: TreeNode) {
    state.removeLast()
}

/* Backtracking algorithm: Example three */
func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
    // Check if it's a solution
    if isSolution(state: state) {
        recordSolution(state: state, res: &res)
    }
    // Traverse all choices
    for choice in choices {
        // Pruning: check if the choice is legal
        if isValid(state: state, choice: choice) {
            // Attempt: make a choice, update the state
            makeChoice(state: &state, choice: choice)
            // Proceed to the next round of selection
            backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
            // Retract: undo the choice, restore to the previous state
            undoChoice(state: &state, choice: choice)
        }
    }
}

@main
enum PreorderTraversalIIITemplate {
    /* Driver Code */
    static func main() {
        let root = TreeNode.listToTree(arr: [1, 7, 3, 4, 5, 6, 7])
        print("\nInitialize binary tree")
        PrintUtil.printTree(root: root)

        // Backtracking algorithm
        var state: [TreeNode] = []
        var res: [[TreeNode]] = []
        backtrack(state: &state, choices: [root].compactMap { $0 }, res: &res)

        print("\nOutput all root-to-node 7 paths, not including nodes with value 3")
        for path in res {
            var vals: [Int] = []
            for node in path {
                vals.append(node.val)
            }
            print(vals)
        }
    }
}
