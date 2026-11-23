/**
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 함수 */
@discardableResult
func function() -> Int {
    // 몇 가지 연산을 수행한다
    return 0
}

/* 상수 차수 */
func constant(n: Int) {
    // 상수, 변수, 객체는 O(1) 공간을 차지한다
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // 반복문 안의 변수는 O(1) 공간을 차지한다
    for _ in 0 ..< n {
        let c = 0
    }
    // 반복문 안의 함수는 O(1) 공간을 차지한다
    for _ in 0 ..< n {
        function()
    }
}

/* 선형 차수 */
func linear(n: Int) {
    // 길이가 n인 배열은 O(n) 공간을 차지한다
    let nums = Array(repeating: 0, count: n)
    // 길이가 n인 리스트는 O(n) 공간을 차지한다
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

/* 선형 차수(재귀 구현) */
func linearRecur(n: Int) {
    print("재귀 n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

/* 제곱 차수 */
func quadratic(n: Int) {
    // 이차원 리스트는 O(n^2) 공간을 차지한다
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

/* 제곱 차수(재귀 구현) */
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // 배열 nums의 길이는 n, n-1, ..., 2, 1이다
    let nums = Array(repeating: 0, count: n)
    print("재귀(n = \(n))의 nums 길이 = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

/* 지수 차수(포화 이진 트리 구성) */
func buildTree(n: Int) -> TreeNode? {
    if n == 0 {
        return nil
    }
    let root = TreeNode(x: 0)
    root.left = buildTree(n: n - 1)
    root.right = buildTree(n: n - 1)
    return root
}

@main
enum SpaceComplexity {
    /* 실행 코드 */
    static func main() {
        let n = 5
        // 상수 차수
        constant(n: n)
        // 선형 차수
        linear(n: n)
        linearRecur(n: n)
        // 제곱 차수
        quadratic(n: n)
        quadraticRecur(n: n)
        // 지수 차수
        let root = buildTree(n: n)
        PrintUtil.printTree(root: root)
    }
}
