/*
 * File: space_complexity.swift
 * Created Time: 2023-01-01
 * Author: nuomi1 (nuomi1@qq.com)
 */

class ListNode {
    var val: Int
    var next: ListNode?

    init(x: Int) {
        val = x
    }
}

class TreeNode {
    var val: Int // 结点值
    var height: Int // 结点高度
    var left: TreeNode? // 左子结点引用
    var right: TreeNode? // 右子结点引用

    init(x: Int) {
        val = x
        height = 0
    }
}

enum PrintUtil {
    private class Trunk {
        var prev: Trunk?
        var str: String

        init(prev: Trunk?, str: String) {
            self.prev = prev
            self.str = str
        }
    }

    static func printTree(root: TreeNode?) {
        printTree(root: root, prev: nil, isLeft: false)
    }

    private static func printTree(root: TreeNode?, prev: Trunk?, isLeft: Bool) {
        if root == nil {
            return
        }

        var prevStr = "    "
        let trunk = Trunk(prev: prev, str: prevStr)

        printTree(root: root?.right, prev: trunk, isLeft: true)

        if prev == nil {
            trunk.str = "———"
        } else if isLeft {
            trunk.str = "/———"
            prevStr = "   |"
        } else {
            trunk.str = "\\———"
            prev?.str = prevStr
        }

        showTrunks(p: trunk)
        print(" \(root!.val)")

        if prev != nil {
            prev?.str = prevStr
        }
        trunk.str = "   |"

        printTree(root: root?.left, prev: trunk, isLeft: false)
    }

    private static func showTrunks(p: Trunk?) {
        if p == nil {
            return
        }

        showTrunks(p: p?.prev)
        print(p!.str, terminator: "")
    }
}

// 函数
@discardableResult
func function() -> Int {
    // do something
    return 0
}

// 常数阶
func constant(n: Int) {
    // 常量、变量、对象占用 O(1) 空间
    let a = 0
    var b = 0
    let nums = Array(repeating: 0, count: 10000)
    let node = ListNode(x: 0)
    // 循环中的变量占用 O(1) 空间
    for _ in 0 ..< n {
        let c = 0
    }
    // 循环中的函数占用 O(1) 空间
    for _ in 0 ..< n {
        function()
    }
}

// 线性阶
func linear(n: Int) {
    // 长度为 n 的数组占用 O(n) 空间
    let nums = Array(repeating: 0, count: n)
    // 长度为 n 的列表占用 O(n) 空间
    let nodes = (0 ..< n).map { ListNode(x: $0) }
    // 长度为 n 的哈希表占用 O(n) 空间
    let map = Dictionary(uniqueKeysWithValues: (0 ..< n).map { ($0, "\($0)") })
}

// 线性阶（递归实现）
func linearRecur(n: Int) {
    print("递归 n = \(n)")
    if n == 1 {
        return
    }
    linearRecur(n: n - 1)
}

// 平方阶
func quadratic(n: Int) {
    // 二维列表占用 O(n^2) 空间
    let numList = Array(repeating: Array(repeating: 0, count: n), count: n)
}

// 平方阶（递归实现）
@discardableResult
func quadraticRecur(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    let nums = Array(repeating: 0, count: n)
    print("递归 n = \(n) 中的 nums 长度 = \(nums.count)")
    return quadraticRecur(n: n - 1)
}

// 指数阶（建立满二叉树）
func buildTree(n: Int) -> TreeNode? {
    if n == 0 {
        return nil
    }
    let root = TreeNode(x: 0)
    root.left = buildTree(n: n - 1)
    root.right = buildTree(n: n - 1)
    return root
}

// Driver Code
func main() {
    let n = 5
    // 常数阶
    constant(n: n)
    // 线性阶
    linear(n: n)
    linearRecur(n: n)
    // 平方阶
    quadratic(n: n)
    quadraticRecur(n: n)
    // 指数阶
    let root = buildTree(n: n)
    PrintUtil.printTree(root: root)
}

main()
