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
        // キューを初期化し、根ノードを追加する
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // 走査順序を保存するリストを初期化する
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // キューからデキューする
            list.add(node.val);           // ノードの値を保存する
            if (node.left != null)
                queue.offer(node.left);   // 左の子ノードをエンキューする
            if (node.right != null)
                queue.offer(node.right);  // 右の子ノードをエンキューする
        }
        return list;
    }

    public static void main(String[] args) {
        /* 二分木を初期化する */
        // ここでは配列から二分木を直接生成する関数を使う
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化する\n");
        PrintUtil.printTree(root);

        /* レベル順走査 */
        List<Integer> list = levelOrder(root);
        System.out.println("\nレベル順走査で表示するノードの順序 = " + list);
    }
}
