/**
 * File: array_binary_tree.swift
 * Created Time: 2023-07-23
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 배열로 표현한 이진 트리 클래스 */
class ArrayBinaryTree {
    private var tree: [Int?]

    /* 생성자 */
    init(arr: [Int?]) {
        tree = arr
    }

    /* 리스트 용량 */
    func size() -> Int {
        tree.count
    }

    /* 인덱스가 i인 노드의 값 반환 */
    func val(i: Int) -> Int? {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
        if i < 0 || i >= size() {
            return nil
        }
        return tree[i]
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    func parent(i: Int) -> Int {
        (i - 1) / 2
    }

    /* 레벨 순서 순회 */
    func levelOrder() -> [Int] {
        var res: [Int] = []
        // 배열을 직접 순회한다
        for i in 0 ..< size() {
            if let val = val(i: i) {
                res.append(val)
            }
        }
        return res
    }

    /* 깊이 우선 순회 */
    private func dfs(i: Int, order: String, res: inout [Int]) {
        // 빈칸이면 반환한다
        guard let val = val(i: i) else {
            return
        }
        // 전위 순회
        if order == "pre" {
            res.append(val)
        }
        dfs(i: left(i: i), order: order, res: &res)
        // 중위 순회
        if order == "in" {
            res.append(val)
        }
        dfs(i: right(i: i), order: order, res: &res)
        // 후위 순회
        if order == "post" {
            res.append(val)
        }
    }

    /* 전위 순회 */
    func preOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "pre", res: &res)
        return res
    }

    /* 중위 순회 */
    func inOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "in", res: &res)
        return res
    }

    /* 후위 순회 */
    func postOrder() -> [Int] {
        var res: [Int] = []
        dfs(i: 0, order: "post", res: &res)
        return res
    }
}

@main
enum _ArrayBinaryTree {
    /* 실행 코드 */
    static func main() {
        // 이진 트리 초기화
        // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
        let arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]

        let root = TreeNode.listToTree(arr: arr)
        print("\n이진 트리 초기화\n")
        print("이진 트리의 배열 표현:")
        print(arr)
        print("이진 트리의 연결 리스트 표현:")
        PrintUtil.printTree(root: root)

        // 배열로 표현한 이진 트리 클래스
        let abt = ArrayBinaryTree(arr: arr)

        // 노드 접근
        let i = 1
        let l = abt.left(i: i)
        let r = abt.right(i: i)
        let p = abt.parent(i: i)
        print("\n현재 노드의 인덱스: \(i), 값: \(abt.val(i: i) as Any)")
        print("왼쪽 자식 노드의 인덱스: \(l), 값: \(abt.val(i: l) as Any)")
        print("오른쪽 자식 노드의 인덱스: \(r), 값: \(abt.val(i: r) as Any)")
        print("부모 노드의 인덱스: \(p), 값: \(abt.val(i: p) as Any)")

        // 트리 순회
        var res = abt.levelOrder()
        print("\n레벨 순서 순회: \(res)")
        res = abt.preOrder()
        print("전위 순회: \(res)")
        res = abt.inOrder()
        print("중위 순회: \(res)")
        res = abt.postOrder()
        print("후위 순회: \(res)")
    }
}
