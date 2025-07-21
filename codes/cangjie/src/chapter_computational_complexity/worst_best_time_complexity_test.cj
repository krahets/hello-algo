/**
 * File: worst_best_time_complexity.cj
 * Created Time: 2025-06-21
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_computational_complexity

import std.unittest.testmacro.*
import std.unittest.*

@Test
func testWorstBestTimeComplexity() {
    let n = 5
    for (i in 0..n) {
        let n = 100
        let nums = randomNumbers(n)
        var index = findOne(nums)
        println("\n数组 [ 1, 2, ..., ${n} ] 被打乱后 = ${nums}")
        println("数字 1 的索引为 ${index}")
    }
}
