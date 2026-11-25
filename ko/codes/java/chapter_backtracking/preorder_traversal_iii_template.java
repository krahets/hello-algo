/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* 현재 상태가 해인지 확인한다 */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* 해를 기록한다 */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* 현재 상태에서 이 선택이 유효한지 확인한다 */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 상태를 갱신한다 */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 상태를 복원한다 */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* 백트래킹: 예제 3 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 해인지 확인한다
        if (isSolution(state)) {
            // 해를 기록한다
            recordSolution(state, res);
        }
        // 모든 선택지를 순회한다
        for (TreeNode choice : choices) {
            // 가지치기: 선택이 유효한지 확인한다
            if (isValid(state, choice)) {
                // 시도: 하나를 선택하고 상태를 갱신한다
                makeChoice(state, choice);
                // 다음 선택을 진행한다
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n이진 트리 초기화");
        PrintUtil.printTree(root);

        // 백트래킹 알고리즘
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\n루트에서 값이 7인 노드까지 값이 3인 노드를 거치지 않는 모든 경로 출력");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
