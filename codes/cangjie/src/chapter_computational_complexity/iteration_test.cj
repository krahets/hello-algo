package cangjie.chapter_computational_complexity

import std.unittest.testmacro.*
import std.unittest.*

/* Driver Code */
@Test
func testIteration() {
    let n = 5
    var res = forLoop(n)
    println("\nfor 循环的求和结果 res = ${res}")

    res = whileLoop(n)
    println("\nwhile 循环的求和结果 res = ${res}")

    res = whileLoopII(n)
    println("\nwhile 循环（两次更新）求和结果 res = ${res}")

    let resStr = nestedForLoop(n)
    println("\n双层 for 循环的遍历结果 ${resStr}")

}
