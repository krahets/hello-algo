/**
 * File: binary_tree_bfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_bfs {
    /* 層序走訪 */
    static List<Integer> levelOrder(TreeNode root) {
        // 初始化佇列並加入根節點
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // 初始化一個串列，用來儲存走訪序列
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // 從佇列前端取出節點
            list.add(node.val);           // 儲存節點值
            if (node.left != null)
                queue.offer(node.left);   // 將左子節點加入佇列
            if (node.right != null)
                queue.offer(node.right);  // 將右子節點加入佇列
        }
        return list;
    }

    public static void main(String[] args) {
        /* 初始化二元樹 */
        // 這裡使用能從陣列直接建立二元樹的函式
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n初始化二元樹\n");
        PrintUtil.printTree(root);

        /* 層序走訪 */
        List<Integer> list = levelOrder(root);
        System.out.println("\n依層序走訪印出的節點序列 = " + list);
    }
}
