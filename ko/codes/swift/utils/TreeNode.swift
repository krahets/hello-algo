/**
 * File: TreeNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 이진 트리 노드 클래스 */
public class TreeNode {
    public var val: Int // 노드 값
    public var height: Int // 노드 높이
    public var left: TreeNode? // 왼쪽 자식 노드 참조
    public var right: TreeNode? // 오른쪽 자식 노드 참조

    /* 생성자 */
    public init(x: Int) {
        val = x
        height = 0
    }

    // 직렬화 인코딩 규칙은 다음을 참고한다:
    // https://www.hello-algo.com/ko/chapter_tree/array_representation_of_tree/
    // 이진 트리의 배열 표현:
    // [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    // 이진 트리의 연결 리스트 표현:
    //             /——— 15
    //         /——— 7
    //     /——— 3
    //    |    \——— 6
    //    |        \——— 12
    // ——— 1
    //     \——— 2
    //        |    /——— 9
    //         \——— 4
    //             \——— 8

    /* 리스트를 이진 트리로 역직렬화: 재귀 */
    private static func listToTreeDFS(arr: [Int?], i: Int) -> TreeNode? {
        if i < 0 || i >= arr.count || arr[i] == nil {
            return nil
        }
        let root = TreeNode(x: arr[i]!)
        root.left = listToTreeDFS(arr: arr, i: 2 * i + 1)
        root.right = listToTreeDFS(arr: arr, i: 2 * i + 2)
        return root
    }

    /* 리스트를 이진 트리로 역직렬화 */
    public static func listToTree(arr: [Int?]) -> TreeNode? {
        listToTreeDFS(arr: arr, i: 0)
    }

    /* 이진 트리를 리스트로 직렬화: 재귀 */
    private static func treeToListDFS(root: TreeNode?, i: Int, res: inout [Int?]) {
        if root == nil {
            return
        }
        while i >= res.count {
            res.append(nil)
        }
        res[i] = root?.val
        treeToListDFS(root: root?.left, i: 2 * i + 1, res: &res)
        treeToListDFS(root: root?.right, i: 2 * i + 2, res: &res)
    }

    /* 이진 트리를 리스트로 직렬화 */
    public static func treeToList(root: TreeNode?) -> [Int?] {
        var res: [Int?] = []
        treeToListDFS(root: root, i: 0, res: &res)
        return res
    }
}
