/**
 * File: preorder_traversal_iii_compact.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_compact {
    static List<TreeNode> path;
    static List<List<TreeNode>> res;

    /* 前順走査：例３ */
    static void preOrder(TreeNode root) {
        // 剪定
        if (root == null || root.val == 3) {
            return;
        }
        // 試行
        path.add(root);
        if (root.val == 7) {
            // 解を記録
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 回退
        path.remove(path.size() - 1);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化");
        PrintUtil.printTree(root);

        // 前順走査
        path = new ArrayList<>();
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\nルートからノード7までのすべてのパスを出力、値3のノードは含まない");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}