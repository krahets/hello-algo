/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* 判斷目前的狀態是否為解 */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* 記錄此解 */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* 判斷這個選擇在目前的狀態下是否合法 */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 更新狀態 */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 還原狀態 */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* 回溯演算法：例題三 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 檢查目前的狀態是否為解
        if (isSolution(state)) {
            // 記錄此解
            recordSolution(state, res);
        }
        // 逐一檢查所有選項
        for (TreeNode choice : choices) {
            // 剪枝：檢查選擇是否合法
            if (isValid(state, choice)) {
                // 嘗試：做出選擇並更新狀態
                makeChoice(state, choice);
                // 進入下一輪選擇
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // 回溯：撤銷選擇，還原先前的狀態
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n初始化二元樹");
        PrintUtil.printTree(root);

        // 回溯演算法
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\n輸出從根節點到值為 7 的節點的所有路徑，且路徑中不得包含值為 3 的節點");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
