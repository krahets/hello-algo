/**
 * File: binary_tree_bfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_bfs {
    /* 레벨 순회 */
    static List<Integer> levelOrder(TreeNode root) {
        // 큐를 초기화하고 루트 노드를 넣는다
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // 순회 결과를 저장할 리스트를 초기화한다
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // 큐에서 노드를 꺼낸다
            list.add(node.val);           // 노드 값을 저장한다
            if (node.left != null)
                queue.offer(node.left);   // 왼쪽 자식을 큐에 넣는다
            if (node.right != null)
                queue.offer(node.right);  // 오른쪽 자식을 큐에 넣는다
        }
        return list;
    }

    public static void main(String[] args) {
        /* 이진 트리 초기화 */
        // 배열에서 바로 이진 트리를 만드는 함수를 사용한다
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n이진 트리 초기화\n");
        PrintUtil.printTree(root);

        /* 레벨 순회 */
        List<Integer> list = levelOrder(root);
        System.out.println("\n레벨 순회로 출력한 노드 순서 = " + list);
    }
}
