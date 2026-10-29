/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* 現在の状態が解かを判定 */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* 解を記録する */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* 現在の状態でこの選択が有効か判定 */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 状態を更新する */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 状態を復元する */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* バックトラッキング：例題 3 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 解かを確認
        if (isSolution(state)) {
            // 解を記録する
            recordSolution(state, res);
        }
        // すべての選択肢を走査する
        for (TreeNode choice : choices) {
            // 枝刈り：選択が有効か確認
            if (isValid(state, choice)) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state, choice);
                // 次の選択に進む
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化する");
        PrintUtil.printTree(root);

        // バックトラッキング
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
