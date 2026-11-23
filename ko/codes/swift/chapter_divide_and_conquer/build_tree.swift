/**
 * File: build_tree.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 이진 트리 구성: 분할 정복 */
func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
    // 서브트리 구간이 비어 있으면 종료한다
    if r - l < 0 {
        return nil
    }
    // 루트 노드를 초기화한다
    let root = TreeNode(x: preorder[i])
    // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
    let m = inorderMap[preorder[i]]!
    // 부분 문제: 왼쪽 서브트리 구성
    root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
    // 부분 문제: 오른쪽 서브트리 구성
    root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
    // 루트 노드를 반환한다
    return root
}

/* 이진 트리 구성 */
func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
    // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
    let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
}

@main
enum BuildTree {
    /* 실행 코드 */
    static func main() {
        let preorder = [3, 9, 2, 1, 7]
        let inorder = [9, 3, 1, 2, 7]
        print("전위 순회 = \(preorder)")
        print("중위 순회 = \(inorder)")

        let root = buildTree(preorder: preorder, inorder: inorder)
        print("구성한 이진 트리:")
        PrintUtil.printTree(root: root)
    }
}
