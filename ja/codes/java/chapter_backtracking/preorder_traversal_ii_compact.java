/**
 * File: preorder_traversal_ii_compact.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_ii_compact {
    static List<TreeNode> path;
    static List<List<TreeNode>> res;

    /* 前順走査：例題 2 */
    static void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // 試す
        path.add(root);
        if (root.val == 7) {
            // 解を記録
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // バックトラック
        path.remove(path.size() - 1);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化");
        PrintUtil.printTree(root);

        // 先行順走査
        path = new ArrayList<>();
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\n根ノードからノード 7 までのすべての経路を出力");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
