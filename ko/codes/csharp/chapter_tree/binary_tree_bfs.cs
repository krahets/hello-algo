/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* 레벨 순서 순회 */
    List<int> LevelOrder(TreeNode root) {
        // 큐를 초기화하고 루트 노드를 넣는다
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // 순회 순서를 저장할 리스트를 초기화한다
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // 큐에서 꺼낸다
            list.Add(node.val!.Value);       // 노드 값을 저장한다
            if (node.left != null)
                queue.Enqueue(node.left);    // 왼쪽 자식 노드를 큐에 삽입한다
            if (node.right != null)
                queue.Enqueue(node.right);   // 오른쪽 자식 노드를 큐에 삽입한다
        }
        return list;
    }

    [Test]
    public void Test() {
        /* 이진 트리 초기화 */
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n이진 트리 초기화\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\n레벨 순서 순회의 노드 출력 순서 = " + string.Join(",", list));
    }
}
