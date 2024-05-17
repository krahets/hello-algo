// File: merge_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 合并左子数组和右子数组
// 左子数组区间 [left, mid]
// 右子数组区间 [mid + 1, right]
fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
    // 初始化辅助数组
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var tmp = try mem_allocator.alloc(i32, right + 1 - left);
    std.mem.copy(i32, tmp, nums[left..right+1]);
    // 左子数组的起始索引和结束索引
    var leftStart = left - left;
    var leftEnd = mid - left;
    // 右子数组的起始索引和结束索引
    var rightStart = mid + 1 - left;
    var rightEnd = right - left;
    // i, j 分别指向左子数组、右子数组的首元素
    var i = leftStart;
    var j = rightStart;
    // 通过覆盖原数组 nums 来合并左子数组和右子数组
    var k = left;
    while (k <= right) : (k += 1) {
        // 若“左子数组已全部合并完”，则选取右子数组元素，并且 j++
        if (i > leftEnd) {
            nums[k] = tmp[j];
            j += 1;
        // 否则，若“右子数组已全部合并完”或“左子数组元素 <= 右子数组元素”，则选取左子数组元素，并且 i++
        } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
            nums[k] = tmp[i];
            i += 1;
        // 否则，若“左右子数组都未全部合并完”且“左子数组元素 > 右子数组元素”，则选取右子数组元素，并且 j++
        } else {
            nums[k] = tmp[j];
            j += 1;
        }
    }
}

// 归并排序
fn mergeSort(nums: []i32, left: usize, right: usize) !void {
    // 终止条件
    if (left >= right) return;              // 当子数组长度为 1 时终止递归
    // 划分阶段
    var mid = left + (right - left) / 2;    // 计算中点
    try mergeSort(nums, left, mid);         // 递归左子数组
    try mergeSort(nums, mid + 1, right);    // 递归右子数组
    // 合并阶段
    try merge(nums, left, mid, right);
}

// Driver Code
pub fn main() !void {
    // 归并排序
    var nums = [_]i32{ 7, 3, 2, 6, 0, 1, 5, 4 };
    try mergeSort(&nums, 0, nums.len - 1);
    std.debug.print("归并排序完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    _ = try std.io.getStdIn().reader().readByte();
}
