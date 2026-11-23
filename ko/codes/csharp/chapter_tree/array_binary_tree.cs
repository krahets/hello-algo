/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* 배열로 표현한 이진 트리 클래스 */
public class ArrayBinaryTree(List<int?> arr) {
    List<int?> tree = new(arr);

    /* 리스트 용량 */
    public int Size() {
        return tree.Count;
    }

    /* 인덱스가 i인 노드의 값 반환 */
    public int? Val(int i) {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
        if (i < 0 || i >= Size())
            return null;
        return tree[i];
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    public int Left(int i) {
        return 2 * i + 1;
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    public int Right(int i) {
        return 2 * i + 2;
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    public int Parent(int i) {
        return (i - 1) / 2;
    }

    /* 레벨 순서 순회 */
    public List<int> LevelOrder() {
        List<int> res = [];
        // 배열을 직접 순회한다
        for (int i = 0; i < Size(); i++) {
            if (Val(i).HasValue)
                res.Add(Val(i)!.Value);
        }
        return res;
    }

    /* 깊이 우선 순회 */
    void DFS(int i, string order, List<int> res) {
        // 빈칸이면 반환한다
        if (!Val(i).HasValue)
            return;
        // 전위 순회
        if (order == "pre")
            res.Add(Val(i)!.Value);
        DFS(Left(i), order, res);
        // 중위 순회
        if (order == "in")
            res.Add(Val(i)!.Value);
        DFS(Right(i), order, res);
        // 후위 순회
        if (order == "post")
            res.Add(Val(i)!.Value);
    }

    /* 전위 순회 */
    public List<int> PreOrder() {
        List<int> res = [];
        DFS(0, "pre", res);
        return res;
    }

    /* 중위 순회 */
    public List<int> InOrder() {
        List<int> res = [];
        DFS(0, "in", res);
        return res;
    }

    /* 후위 순회 */
    public List<int> PostOrder() {
        List<int> res = [];
        DFS(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    [Test]
    public void Test() {
        // 이진 트리 초기화
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\n이진 트리 초기화\n");
        Console.WriteLine("이진 트리의 배열 표현:");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("이진 트리의 연결 리스트 표현:");
        PrintUtil.PrintTree(root);

        // 배열로 표현한 이진 트리 클래스
        ArrayBinaryTree abt = new(arr);

        // 노드 접근
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\n현재 노드의 인덱스: " + i + " , 값: " + abt.Val(i));
        Console.WriteLine("왼쪽 자식 노드의 인덱스: " + l + " , 값: " + (abt.Val(l).HasValue ? abt.Val(l) : "null"));
        Console.WriteLine("오른쪽 자식 노드의 인덱스: " + r + " , 값: " + (abt.Val(r).HasValue ? abt.Val(r) : "null"));
        Console.WriteLine("부모 노드의 인덱스: " + p + " , 값: " + (abt.Val(p).HasValue ? abt.Val(p) : "null"));

        // 트리 순회
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\n레벨 순서 순회:" + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("전위 순회:" + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("중위 순회:" + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("후위 순회:" + res.PrintList());
    }
}