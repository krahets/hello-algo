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

    /* 전위 순회: 예제 3 */
    static void preOrder(TreeNode root) {
        // 가지치기
        if (root == null || root.val == 3) {
            return;
        }
        // 시도
        path.add(root);
        if (root.val == 7) {
            // 해를 기록한다
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 되돌리기
        path.remove(path.size() - 1);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\n이진 트리 초기화");
        PrintUtil.printTree(root);

        // 전위 순회
        path = new ArrayList<>();
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\n루트 노드에서 노드 7까지의 모든 경로 출력. 경로에는 값이 3인 노드가 포함되지 않는다");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
