/**
 * File: array_binary_tree.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_tree

import utils.TreeNode
import utils.printTree

/* 배열로 표현한 이진 트리 클래스 */
class ArrayBinaryTree(private val tree: MutableList<Int?>) {
    /* 리스트 용량 */
    fun size(): Int {
        return tree.size
    }

    /* 인덱스가 i인 노드의 값 반환 */
    fun _val(i: Int): Int? {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
        if (i < 0 || i >= size()) return null
        return tree[i]
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    fun left(i: Int): Int {
        return 2 * i + 1
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    fun right(i: Int): Int {
        return 2 * i + 2
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    fun parent(i: Int): Int {
        return (i - 1) / 2
    }

    /* 레벨 순서 순회 */
    fun levelOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        // 배열을 직접 순회한다
        for (i in 0..<size()) {
            if (_val(i) != null)
                res.add(_val(i))
        }
        return res
    }

    /* 깊이 우선 순회 */
    fun dfs(i: Int, order: String, res: MutableList<Int?>) {
        // 빈칸이면 반환한다
        if (_val(i) == null)
            return
        // 전위 순회
        if ("pre" == order)
            res.add(_val(i))
        dfs(left(i), order, res)
        // 중위 순회
        if ("in" == order)
            res.add(_val(i))
        dfs(right(i), order, res)
        // 후위 순회
        if ("post" == order)
            res.add(_val(i))
    }

    /* 전위 순회 */
    fun preOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "pre", res)
        return res
    }

    /* 중위 순회 */
    fun inOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "in", res)
        return res
    }

    /* 후위 순회 */
    fun postOrder(): MutableList<Int?> {
        val res = mutableListOf<Int?>()
        dfs(0, "post", res)
        return res
    }
}

/* 실행 코드 */
fun main() {
    // 이진 트리 초기화
    // 여기서는 리스트로 이진 트리를 바로 생성하는 함수를 사용한다
    val arr = mutableListOf(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15)

    val root = TreeNode.listToTree(arr)
    println("\n이진 트리 초기화\n")
    println("이진 트리의 배열 표현:")
    println(arr)
    println("이진 트리의 연결 리스트 표현:")
    printTree(root)

    // 배열로 표현한 이진 트리 클래스
    val abt = ArrayBinaryTree(arr)

    // 노드 접근
    val i = 1
    val l = abt.left(i)
    val r = abt.right(i)
    val p = abt.parent(i)
    println("현재 노드의 인덱스: $i , 값: ${abt._val(i)}")
    println("왼쪽 자식 노드의 인덱스: $l , 값: ${abt._val(l)}")
    println("오른쪽 자식 노드의 인덱스: $r , 값: ${abt._val(r)}")
    println("부모 노드의 인덱스: $p , 값: ${abt._val(p)}")

    // 트리 순회
    var res = abt.levelOrder()
    println("\n레벨 순서 순회: $res")
    res = abt.preOrder()
    println("전위 순회: $res")
    res = abt.inOrder()
    println("중위 순회: $res")
    res = abt.postOrder()
    println("후위 순회: $res")
}