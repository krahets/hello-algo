// File: bubble_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 버블 정렬
fn bubbleSort(nums: []i32) void {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]을 교환한다
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

// 버블 정렬(플래그 최적화)
fn bubbleSortWithFlag(nums: []i32) void {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var flag = false;   // 플래그를 초기화한다
        var j: usize = 0;
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]을 교환한다
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;
            }
        }
        if (!flag) break;   // 이번 버블 과정에서 원소 교환이 없었으므로 바로 종료한다
    }
}

// 실행 코드
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSort(&nums);
    std.debug.print("버블 정렬을 마친 후 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    var nums1 = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSortWithFlag(&nums1);
    std.debug.print("\n버블 정렬 후 nums1 = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);
    
    _ = try std.io.getStdIn().reader().readByte();
}

