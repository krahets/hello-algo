/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* 陣列表示下的二元樹類別 */
class ArrayBinaryTree {
    private List<Integer> tree;

    /* 建構子 */
    public ArrayBinaryTree(List<Integer> arr) {
        tree = new ArrayList<>(arr);
    }

    /* 串列容量 */
    public int size() {
        return tree.size();
    }

    /* 獲取索引為 i 節點的值 */
    public Integer val(int i) {
        // 若索引越界，則返回 null ，代表空位
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* 獲取索引為 i 節點的左子節點的索引 */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* 獲取索引為 i 節點的右子節點的索引 */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* 獲取索引為 i 節點的父節點的索引 */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* 層序走訪 */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // 直接走訪陣列
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* 深度優先走訪 */
    private void dfs(Integer i, String order, List<Integer> res) {
        // 若為空位，則返回
        if (val(i) == null)
            return;
        // 前序走訪
        if ("pre".equals(order))
            res.add(val(i));
        dfs(left(i), order, res);
        // 中序走訪
        if ("in".equals(order))
            res.add(val(i));
        dfs(right(i), order, res);
        // 後序走訪
        if ("post".equals(order))
            res.add(val(i));
    }

    /* 前序走訪 */
    public List<Integer> preOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "pre", res);
        return res;
    }

    /* 中序走訪 */
    public List<Integer> inOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "in", res);
        return res;
    }

    /* 後序走訪 */
    public List<Integer> postOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    public static void main(String[] args) {
        // 初始化二元樹
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\n初始化二元樹\n");
        System.out.println("二元樹的陣列表示：");
        System.out.println(arr);
        System.out.println("二元樹的鏈結串列表示：");
        PrintUtil.printTree(root);

        // 陣列表示下的二元樹類別
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // 訪問節點
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\n當前節點的索引為 " + i + " ，值為 " + abt.val(i));
        System.out.println("其左子節點的索引為 " + l + " ，值為 " + (l == null ? "null" : abt.val(l)));
        System.out.println("其右子節點的索引為 " + r + " ，值為 " + (r == null ? "null" : abt.val(r)));
        System.out.println("其父節點的索引為 " + p + " ，值為 " + (p == null ? "null" : abt.val(p)));

        // 走訪樹
        List<Integer> res = abt.levelOrder();
        System.out.println("\n層序走訪為：" + res);
        res = abt.preOrder();
        System.out.println("前序走訪為：" + res);
        res = abt.inOrder();
        System.out.println("中序走訪為：" + res);
        res = abt.postOrder();
        System.out.println("後序走訪為：" + res);
    }
}
