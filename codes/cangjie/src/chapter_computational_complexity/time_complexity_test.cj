package cangjie.chapter_computational_complexity

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testTimeComplexity() {
    // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    let n = 8
    println("输入数据大小 n = ${n}")

    var count = constant(n)
    println("常数阶的操作数量 = ${count}")

    count = linear(n)
    println("线性阶的操作数量 = ${count}")
    count = arrayTraversal(Array<Int64>(n, item: 0))
    println("线性阶（遍历数组）的操作数量 = ${count}")

    count = quadratic(n)
    println("平方阶的操作数量 = ${count}")
    let nums = Array<Int64>(n, item: 0)
    for (i in 0..n) {
        nums[i] = n - i // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums)
    println("平方阶（冒泡排序）的操作数量 = ${count}")

    count = exponential(n)
    println("指数阶（循环实现）的操作数量 = ${count}")
    count = expRecur(n)
    println("指数阶（递归实现）的操作数量 = ${count}")

    count = logarithmic(n)
    println("对数阶（循环实现）的操作数量 = ${count}")
    count = logRecur(n)
    println("对数阶（递归实现）的操作数量 = ${count}")

    count = linearLogRecur(n)
    println("线性对数阶（递归实现）的操作数量 = ${count}")

    count = factorialRecur(n)
    println("阶乘阶（递归实现）的操作数量 = ${count}")
}
