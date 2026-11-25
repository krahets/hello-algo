// File: time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// Constant time
fn constant(n: i32) i32 {
    _ = n;
    var count: i32 = 0;
    const size: i32 = 100_000;
    var i: i32 = 0;
    while (i < size) : (i += 1) {
        count += 1;
    }
    return count;
}

// Linear time
fn linear(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// Linear time (array traversal)
fn arrayTraversal(nums: []i32) i32 {
    var count: i32 = 0;
    // The iteration count is proportional to the array length
    for (nums) |_| {
        count += 1;
    }
    return count;
}

// Quadratic time
fn quadratic(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    // The iteration count grows quadratically with input size n
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            count += 1;
        }
    }
    return count;
}

// Quadratic time (bubble sort)
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0; // Counter
    // Outer loop: the unsorted range is the closed interval [0, i]
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                const tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Swapping two elements takes 3 elementary operations
            }
        }
    }
    return count;
}

// Exponential time (iterative)
fn exponential(n: i32) i32 {
    var count: i32 = 0;
    var bas: i32 = 1;
    var i: i32 = 0;
    // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < bas) : (j += 1) {
            count += 1;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

// Exponential time (recursive)
fn expRecur(n: i32) i32 {
    if (n == 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

// Logarithmic time (iterative)
fn logarithmic(n: i32) i32 {
    var count: i32 = 0;
    var n_var: i32 = n;
    while (n_var > 1) : (n_var = @divTrunc(n_var, 2)) {
        count += 1;
    }
    return count;
}

// Logarithmic time (recursive)
fn logRecur(n: i32) i32 {
    if (n <= 1) return 0;
    return logRecur(@divTrunc(n, 2)) + 1;
}

// Linearithmic time
fn linearLogRecur(n: i32) i32 {
    if (n <= 1) return 1;
    var count: i32 = linearLogRecur(@divTrunc(n, 2)) + linearLogRecur(@divTrunc(n, 2));
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// Factorial time (recursive)
fn factorialRecur(n: i32) i32 {
    if (n == 0) return 1;
    var count: i32 = 0;
    var i: i32 = 0;
    // Split one problem into n subproblems
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// Driver Code
pub fn run() void {
    // Try different values of n to see how the operation count grows for each complexity
    const n: i32 = 8;
    std.debug.print("Input size n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("Constant operation count = {}\n", .{count});

    count = linear(n);
    std.debug.print("Linear operation count = {}\n", .{count});
    var nums = [_]i32{0} ** n;
    count = arrayTraversal(&nums);
    std.debug.print("Linear operation count (array traversal) = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("Quadratic operation count = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i)); // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("Quadratic operation count (bubble sort) = {}\n", .{count});

    count = exponential(n);
    std.debug.print("Exponential operation count (iterative) = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("Exponential operation count (recursive) = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("Logarithmic operation count (iterative) = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("Logarithmic operation count (recursive) = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("Linearithmic operation count (recursive) = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("Factorial operation count (recursive) = {}\n", .{count});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "time_complexity" {
    run();
}
