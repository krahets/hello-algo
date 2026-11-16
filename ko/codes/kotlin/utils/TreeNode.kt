/**
 * File: TreeNode.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package utils

/* 이진 트리 노드 클래스 */
/* 생성자 */
class TreeNode(
    var _val: Int // 노드 값
) {
    var height: Int = 0 // 노드 높이
    var left: TreeNode? = null // 왼쪽 자식 노드 참조
    var right: TreeNode? = null // 오른쪽 자식 노드 참조

    // 직렬화 인코딩 규칙은 다음을 참고한다:
    // https://www.hello-algo.com/ko/chapter_tree/array_representation_of_tree/
    // 이진 트리의 배열 표현:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
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
    companion object {
        private fun listToTreeDFS(arr: MutableList<Int?>, i: Int): TreeNode? {
            if (i < 0 || i >= arr.size || arr[i] == null) {
                return null
            }
            val root = TreeNode(arr[i]!!)
            root.left = listToTreeDFS(arr, 2 * i + 1)
            root.right = listToTreeDFS(arr, 2 * i + 2)
            return root
        }

        /* 리스트를 이진 트리로 역직렬화 */
        fun listToTree(arr: MutableList<Int?>): TreeNode? {
            return listToTreeDFS(arr, 0)
        }

        /* 이진 트리를 리스트로 직렬화: 재귀 */
        private fun treeToListDFS(root: TreeNode?, i: Int, res: MutableList<Int?>) {
            if (root == null) return
            while (i >= res.size) {
                res.add(null)
            }
            res[i] = root._val
            treeToListDFS(root.left, 2 * i + 1, res)
            treeToListDFS(root.right, 2 * i + 2, res)
        }

        /* 이진 트리를 리스트로 직렬화 */
        fun treeToList(root: TreeNode?): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            treeToListDFS(root, 0, res)
            return res
        }
    }
}