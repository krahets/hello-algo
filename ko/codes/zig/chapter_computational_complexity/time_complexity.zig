// File: time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// 상수 차수
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

// 선형 차수
fn linear(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 선형 차수(배열 순회)
fn arrayTraversal(nums: []i32) i32 {
    var count: i32 = 0;
    // 반복 횟수는 배열 길이에 비례한다
    for (nums) |_| {
        count += 1;
    }
    return count;
}

// 제곱 차수
fn quadratic(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            count += 1;
        }
    }
    return count;
}

// 제곱 차수(버블 정렬)
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0; // 카운터
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]을 교환한다
                const tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 원소 교환에는 단위 연산 3회가 포함된다
            }
        }
    }
    return count;
}

// 지수 차수(반복문 구현)
fn exponential(n: i32) i32 {
    var count: i32 = 0;
    var bas: i32 = 1;
    var i: i32 = 0;
    // 세포가 매번 둘로 나뉘어 수열 1, 2, 4, 8, ..., 2^(n-1)을 이룬다
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

// 지수 차수(재귀 구현)
fn expRecur(n: i32) i32 {
    if (n == 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

// 로그 차수(반복문 구현)
fn logarithmic(n: i32) i32 {
    var count: i32 = 0;
    var n_var: i32 = n;
    while (n_var > 1) : (n_var = @divTrunc(n_var, 2)) {
        count += 1;
    }
    return count;
}

// 로그 차수(재귀 구현)
fn logRecur(n: i32) i32 {
    if (n <= 1) return 0;
    return logRecur(@divTrunc(n, 2)) + 1;
}

// 선형 로그 차수
fn linearLogRecur(n: i32) i32 {
    if (n <= 1) return 1;
    var count: i32 = linearLogRecur(@divTrunc(n, 2)) + linearLogRecur(@divTrunc(n, 2));
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// 팩토리얼 차수(재귀 구현)
fn factorialRecur(n: i32) i32 {
    if (n == 0) return 1;
    var count: i32 = 0;
    var i: i32 = 0;
    // 하나에서 n개로 분열한다
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// 실행 코드
pub fn run() void {
    // n을 바꾸어 실행하면서 각 복잡도에서 연산 횟수가 어떻게 변하는지 살펴볼 수 있다
    const n: i32 = 8;
    std.debug.print("입력 데이터 크기 n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("상수 차수의 연산 횟수 = {}\n", .{count});

    count = linear(n);
    std.debug.print("선형 차수의 연산 횟수 = {}\n", .{count});
    var nums = [_]i32{0} ** n;
    count = arrayTraversal(&nums);
    std.debug.print("선형 차수(배열 순회)의 연산 횟수 = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("제곱 차수의 연산 횟수 = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i)); // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("제곱 차수(버블 정렬)의 연산 횟수 = {}\n", .{count});

    count = exponential(n);
    std.debug.print("지수 차수(반복문 구현)의 연산 횟수 = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("지수 차수(재귀 구현)의 연산 횟수 = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("로그 차수(반복문 구현)의 연산 횟수 = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("로그 차수(재귀 구현)의 연산 횟수 = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("선형 로그 차수(재귀 구현)의 연산 횟수 = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("팩토리얼 차수(재귀 구현)의 연산 횟수 = {}\n", .{count});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "time_complexity" {
    run();
}
