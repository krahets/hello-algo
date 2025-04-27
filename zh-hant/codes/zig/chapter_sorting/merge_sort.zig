// File: merge_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 合併左子陣列和右子陣列
// 左子陣列區間 [left, mid]
// 右子陣列區間 [mid + 1, right]
fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
    // 初始化輔助陣列
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var tmp = try mem_allocator.alloc(i32, right + 1 - left);
    std.mem.copy(i32, tmp, nums[left..right+1]);
    // 左子陣列的起始索引和結束索引
    var leftStart = left - left;
    var leftEnd = mid - left;
    // 右子陣列的起始索引和結束索引
    var rightStart = mid + 1 - left;
    var rightEnd = right - left;
    // i, j 分別指向左子陣列、右子陣列的首元素
    var i = leftStart;
    var j = rightStart;
    // 透過覆蓋原陣列 nums 來合併左子陣列和右子陣列
    var k = left;
    while (k <= right) : (k += 1) {
        // 若“左子陣列已全部合併完”，則選取右子陣列元素，並且 j++
        if (i > leftEnd) {
            nums[k] = tmp[j];
            j += 1;
        // 否則，若“右子陣列已全部合併完”或“左子陣列元素 <= 右子陣列元素”，則選取左子陣列元素，並且 i++
        } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
            nums[k] = tmp[i];
            i += 1;
        // 否則，若“左右子陣列都未全部合併完”且“左子陣列元素 > 右子陣列元素”，則選取右子陣列元素，並且 j++
        } else {
            nums[k] = tmp[j];
            j += 1;
        }
    }
}

// 合併排序
fn mergeSort(nums: []i32, left: usize, right: usize) !void {
    // 終止條件
    if (left >= right) return;              // 當子陣列長度為 1 時終止遞迴
    // 劃分階段
    var mid = left + (right - left) / 2;    // 計算中點
    try mergeSort(nums, left, mid);         // 遞迴左子陣列
    try mergeSort(nums, mid + 1, right);    // 遞迴右子陣列
    // 合併階段
    try merge(nums, left, mid, right);
}

// Driver Code
pub fn main() !void {
    // 合併排序
    var nums = [_]i32{ 7, 3, 2, 6, 0, 1, 5, 4 };
    try mergeSort(&nums, 0, nums.len - 1);
    std.debug.print("合併排序完成後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    _ = try std.io.getStdIn().reader().readByte();
}
