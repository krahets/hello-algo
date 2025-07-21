/**
 * File: space_complexity_test.cj
 * Created Time: 2025-06-22
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

import std.unittest.testmacro.*
import std.unittest.*
import cangjie.utils.PrintUtil

@Test
func testSpaceComplexity() {
    let n = 5
    // 常数阶
    SpaceComplexity.constant(n)
    // 线性阶
    SpaceComplexity.linear(n)
    SpaceComplexity.linearRecur(n)
    // 平方阶
    SpaceComplexity.quadratic(n)
    SpaceComplexity.quadraticRecur(n)
    // 指数阶
    let root = SpaceComplexity.buildTree(n)
    PrintUtil.printTree(root)
}
