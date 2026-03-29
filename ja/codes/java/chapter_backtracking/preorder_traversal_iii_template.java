/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* 現在の状態が解かどうかを判定 */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* 解を記録 */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* 現在の状態で、この選択が有効かどうかを判定 */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 状態を更新 */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 状態を元に戻す */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* バックトラッキング：例題 3 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 解かどうかを確認
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
        }
        // すべての選択肢を走査
        for (TreeNode choice : choices) {
            // 枝刈り：選択が妥当かを確認する
            if (isValid(state, choice)) {
                // 試行: 選択を行い、状態を更新
                makeChoice(state, choice);
                // 次の選択へ進む
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // バックトラック：選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化");
        PrintUtil.printTree(root);

        // バックトラッキング法
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\n根ノードからノード 7 までのすべての経路を出力し、経路に値が 3 のノードを含まないことを条件とする");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
