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

// 이차 차수
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

// 이차 차수(버블 정렬)
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0; // 카운터
    // 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]의 값을 맞바꾼다
                const tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
            }
        }
    }
    return count;
}

// 지수 차수(반복 구현)
fn exponential(n: i32) i32 {
    var count: i32 = 0;
    var bas: i32 = 1;
    var i: i32 = 0;
    // 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
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

// 로그 차수(반복 구현)
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
    // 하나가 n개로 나뉜다
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// 실행 예제
pub fn run() void {
    // n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
    const n: i32 = 8;
    std.debug.print("입력 크기 n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("상수 차수 연산 횟수 = {}\n", .{count});

    count = linear(n);
    std.debug.print("선형 차수 연산 횟수 = {}\n", .{count});
    var nums = [_]i32{0} ** n;
    count = arrayTraversal(&nums);
    std.debug.print("선형 차수(배열 순회) 연산 횟수 = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("이차 차수 연산 횟수 = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i)); // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("이차 차수(버블 정렬) 연산 횟수 = {}\n", .{count});

    count = exponential(n);
    std.debug.print("지수 차수(반복 구현) 연산 횟수 = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("지수 차수(재귀 구현) 연산 횟수 = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("로그 차수(반복 구현) 연산 횟수 = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("로그 차수(재귀 구현) 연산 횟수 = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("선형 로그 차수(재귀 구현) 연산 횟수 = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("팩토리얼 차수(재귀 구현) 연산 횟수 = {}\n", .{count});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "time_complexity" {
    run();
}
