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
        // 初始化佇列，加入根節點
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // 初始化一個串列，用於儲存走訪序列
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // 隊列出隊
            list.add(node.val);           // 儲存節點值
            if (node.left != null)
                queue.offer(node.left);   // 左子節點入列
            if (node.right != null)
                queue.offer(node.right);  // 右子節點入列
        }
        return list;
    }

    public static void main(String[] args) {
        /* 初始化二元樹 */
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n初始化二元樹\n");
        PrintUtil.printTree(root);

        /* 層序走訪 */
        List<Integer> list = levelOrder(root);
        System.out.println("\n層序走訪的節點列印序列 = " + list);
    }
}
