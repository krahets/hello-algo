/**
 * File: recursion_test.cj
 * Created Time: 2025-06-21
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testRecursion() {
    let n = 5
    var res = recur(n)
    println("\n递归函数的求和结果 res = ${res}")

    res = forLoopRecur(n)
	println("\n使用迭代模拟递归求和结果 res = ${res}")

	res = tailRecur(n, 0)
	println("\n尾递归函数的求和结果 res = ${res}")

	res = fib(n)
	println("\n斐波那契数列的第 ${n} 项为 ${res}")

}