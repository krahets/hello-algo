/**
 * File: binary_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree {
    [Test]
    public void Test() {
        /* 이진 트리 초기화 */
        // 노드 초기화
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // 노드 사이의 참조(포인터)를 설정한다
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        Console.WriteLine("\n이진 트리 초기화\n");
        PrintUtil.PrintTree(n1);

        /* 노드 삽입과 삭제 */
        TreeNode P = new(0);
        // n1 -> n2 사이에 노드 P를 삽입한다
        n1.left = P;
        P.left = n2;
        Console.WriteLine("\n노드 P를 삽입한 후\n");
        PrintUtil.PrintTree(n1);
        // 노드 P를 삭제한다
        n1.left = n2;
        Console.WriteLine("\n노드 P를 삭제한 후\n");
        PrintUtil.PrintTree(n1);
    }
}
