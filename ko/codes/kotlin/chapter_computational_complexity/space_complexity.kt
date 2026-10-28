/**
 * File: space_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.space_complexity

import utils.ListNode
import utils.TreeNode
import utils.printTree

/* 함수 */
fun function(): Int {
    // 몇 가지 연산을 수행한다
    return 0
}

/* 상수 차수 */
fun constant(n: Int) {
    // 상수, 변수, 객체는 O(1) 공간을 차지한다
    val a = 0
    var b = 0
    val nums = Array(10000) { 0 }
    val node = ListNode(0)
    // 반복문 안의 변수는 O(1) 공간을 차지한다
    for (i in 0..<n) {
        val c = 0
    }
    // 반복문 안의 함수는 O(1) 공간을 차지한다
    for (i in 0..<n) {
        function()
    }
}

/* 선형 차수 */
fun linear(n: Int) {
    // 길이가 n인 배열은 O(n) 공간을 차지한다
    val nums = Array(n) { 0 }
    // 길이가 n인 리스트는 O(n) 공간을 차지한다
    val nodes = mutableListOf<ListNode>()
    for (i in 0..<n) {
        nodes.add(ListNode(i))
    }
    // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
    val map = mutableMapOf<Int, String>()
    for (i in 0..<n) {
        map[i] = i.toString()
    }
}

/* 선형 차수(재귀 구현) */
fun linearRecur(n: Int) {
    println("재귀 n = $n")
    if (n == 1)
        return
    linearRecur(n - 1)
}

/* 제곱 차수 */
fun quadratic(n: Int) {
    // 행렬은 O(n^2) 공간을 차지한다
    val numMatrix = arrayOfNulls<Array<Int>?>(n)
    // 이차원 리스트는 O(n^2) 공간을 차지한다
    val numList = mutableListOf<MutableList<Int>>()
    for (i in 0..<n) {
        val tmp = mutableListOf<Int>()
        for (j in 0..<n) {
            tmp.add(0)
        }
        numList.add(tmp)
    }
}

/* 제곱 차수(재귀 구현) */
tailrec fun quadraticRecur(n: Int): Int {
    if (n <= 0)
        return 0
    // 배열 nums의 길이는 n, n-1, ..., 2, 1이다
    val nums = Array(n) { 0 }
    println("재귀(n = $n)의 nums 길이 = ${nums.size}")
    return quadraticRecur(n - 1)
}

/* 지수 차수(포화 이진 트리 구성) */
fun buildTree(n: Int): TreeNode? {
    if (n == 0)
        return null
    val root = TreeNode(0)
    root.left = buildTree(n - 1)
    root.right = buildTree(n - 1)
    return root
}

/* 실행 코드 */
fun main() {
    val n = 5
    // 상수 차수
    constant(n)
    // 선형 차수
    linear(n)
    linearRecur(n)
    // 제곱 차수
    quadratic(n)
    quadraticRecur(n)
    // 지수 차수
    val root = buildTree(n)
    printTree(root)
}