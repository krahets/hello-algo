// File: recursion.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// 재귀 함수
fn recur(n: i32) i32 {
    // 종료 조건
    if (n == 1) {
        return 1;
    }
    // 내려가기: 재귀 호출
    const res = recur(n - 1);
    // 돌아오기: 결과 반환
    return n + res;
}

// 반복으로 재귀 구현
fn forLoopRecur(comptime n: i32) i32 {
    // 명시적인 스택을 사용하여 시스템 호출 스택을 모방한다
    var stack: [n]i32 = undefined;
    var res: i32 = 0;
    // 내려가기: 재귀 호출
    var i: usize = n;
    while (i > 0) {
        stack[i - 1] = @intCast(i);
        i -= 1;
    }
    // 돌아오기: 결과 반환
    var index: usize = n;
    while (index > 0) {
        index -= 1;
        res += stack[index];
    }
    // res = 1+2+3+...+n
    return res;
}

// 꼬리 재귀 함수
fn tailRecur(n: i32, res: i32) i32 {
    // 종료 조건
    if (n == 0) {
        return res;
    }
    // 꼬리 재귀 호출
    return tailRecur(n - 1, res + n);
}

// 피보나치 수열
fn fib(n: i32) i32 {
    // 종료 조건 f(1) = 0, f(2) = 1
    if (n == 1 or n == 2) {
        return n - 1;
    }
    // 재귀 호출 f(n) = f(n-1) + f(n-2)
    const res: i32 = fib(n - 1) + fib(n - 2);
    // 결과 f(n)을 반환한다
    return res;
}

// 실행 코드
pub fn run() void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = recur(n);
    std.debug.print("재귀 함수로 구한 합 res = {}\n", .{recur(n)});

    res = forLoopRecur(n);
    std.debug.print("반복으로 재귀를 모방하여 구한 합 res = {}\n", .{forLoopRecur(n)});

    res = tailRecur(n, 0);
    std.debug.print("꼬리 재귀 함수로 구한 합 res = {}\n", .{tailRecur(n, 0)});

    res = fib(n);
    std.debug.print("피보나치 수열의 항 번호: {}, 해당 항의 값: {}\n", .{ n, fib(n) });

    std.debug.print("\n", .{});
}

pub fn main() void {
    run();
}

test "recursion" {
    run();
}
