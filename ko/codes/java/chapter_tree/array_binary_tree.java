/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* 배열로 표현한 이진 트리 클래스 */
class ArrayBinaryTree {
    private List<Integer> tree;

    /* 생성자 */
    public ArrayBinaryTree(List<Integer> arr) {
        tree = new ArrayList<>(arr);
    }

    /* 리스트 용량 */
    public int size() {
        return tree.size();
    }

    /* 인덱스가 i인 노드의 값 반환 */
    public Integer val(int i) {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* 레벨 순서 순회 */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // 배열을 직접 순회한다
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* 깊이 우선 순회 */
    private void dfs(Integer i, String order, List<Integer> res) {
        // 빈칸이면 반환한다
        if (val(i) == null)
            return;
        // 전위 순회
        if ("pre".equals(order))
            res.add(val(i));
        dfs(left(i), order, res);
        // 중위 순회
        if ("in".equals(order))
            res.add(val(i));
        dfs(right(i), order, res);
        // 후위 순회
        if ("post".equals(order))
            res.add(val(i));
    }

    /* 전위 순회 */
    public List<Integer> preOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "pre", res);
        return res;
    }

    /* 중위 순회 */
    public List<Integer> inOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "in", res);
        return res;
    }

    /* 후위 순회 */
    public List<Integer> postOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    public static void main(String[] args) {
        // 이진 트리 초기화
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\n이진 트리 초기화\n");
        System.out.println("이진 트리의 배열 표현:");
        System.out.println(arr);
        System.out.println("이진 트리의 연결 리스트 표현:");
        PrintUtil.printTree(root);

        // 배열로 표현한 이진 트리 클래스
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // 노드 접근
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\n현재 노드의 인덱스: " + i + " , 값: " + abt.val(i));
        System.out.println("왼쪽 자식 노드의 인덱스: " + l + " , 값: " + (l == null ? "null" : abt.val(l)));
        System.out.println("오른쪽 자식 노드의 인덱스: " + r + " , 값: " + (r == null ? "null" : abt.val(r)));
        System.out.println("부모 노드의 인덱스: " + p + " , 값: " + (p == null ? "null" : abt.val(p)));

        // 트리 순회
        List<Integer> res = abt.levelOrder();
        System.out.println("\n레벨 순서 순회:" + res);
        res = abt.preOrder();
        System.out.println("전위 순회:" + res);
        res = abt.inOrder();
        System.out.println("중위 순회:" + res);
        res = abt.postOrder();
        System.out.println("후위 순회:" + res);
    }
}
