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

    /* 現在の状態下で選択が合法かどうかを判定 */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 状態を更新 */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 状態を復元 */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* バックトラッキングアルゴリズム：例３ */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 解かどうかをチェック
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
        }
        // すべての選択肢を走査
        for (TreeNode choice : choices) {
            // 剪定：選択が合法かどうかをチェック
            if (isValid(state, choice)) {
                // 試行：選択を行い、状態を更新
                makeChoice(state, choice);
                // 次のラウンドの選択に進む
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // 回退：選択を取り消し、前の状態に復元
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化");
        PrintUtil.printTree(root);

        // バックトラッキングアルゴリズム
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\nルートからノード7までのすべてのパスを出力、パスには値3のノードを含まないことが要求される");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}