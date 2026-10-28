/**
 * File: binary_tree_dfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_dfs {
    List<int> list = [];

    /* 전위 순회 */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* 중위 순회 */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* 후위 순회 */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* 이진 트리 초기화 */
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n이진 트리 초기화\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\n전위 순회의 노드 출력 순서 = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\n중위 순회의 노드 출력 순서 = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\n후위 순회의 노드 출력 순서 = " + string.Join(",", list));
    }
}
