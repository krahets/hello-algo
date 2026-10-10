/**
 * File: binary_tree_bfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_bfs {
    /* レベル順走査 */
    static List<Integer> levelOrder(TreeNode root) {
        // キューを初期化し、ルートノードを追加する
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // 走査順序を保存するためのリストを初期化する
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // デキュー
            list.add(node.val);           // ノードの値を保存する
            if (node.left != null)
                queue.offer(node.left);   // 左子ノードをキューに追加
            if (node.right != null)
                queue.offer(node.right);  // 右子ノードをキューに追加
        }
        return list;
    }

    public static void main(String[] args) {
        /* 二分木を初期化 */
        // ここでは、配列から直接二分木を生成する関数を利用する
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化\n");
        PrintUtil.printTree(root);

        /* レベル順走査 */
        List<Integer> list = levelOrder(root);
        System.out.println("\nレベル順走査のノード出力シーケンス = " + list);
    }
}
