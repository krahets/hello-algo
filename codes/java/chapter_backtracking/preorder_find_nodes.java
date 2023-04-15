/**
 * File: preorder_find_nodes.java
 * Created Time: 2023-04-16
 * Author: Krahets (krahets@163.com)
 */

import include.*;
import java.util.*;

public class preorder_find_nodes {
    static List<TreeNode> res;

    /* 前序遍历 */
    static void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // 尝试
        if (root.val == 7) {
            // 记录解
            res.add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
        // 回退
        return;
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n初始化二叉树");
        PrintUtil.printTree(root);

        // 前序遍历
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\n输出所有根节点到节点 7 的路径");
        List<Integer> vals = new ArrayList<>();
        for (TreeNode node : res) {
            vals.add(node.val);
        }
        System.out.println(vals);
    }
}
