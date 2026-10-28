// File: quick_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 퀵 정렬 클래스
const QuickSort = struct {

    // 원소 교환
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 센티널 분할
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // nums[left]를 피벗으로 삼는다
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            while (i < j and nums[i] <= nums[left]) i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            swap(nums, i, j);   // 두 원소를 교환한다
        }
        swap(nums, i, left);    // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i;               // 피벗의 인덱스를 반환한다
    }

    // 퀵 정렬
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 부분 배열의 길이가 1이면 재귀를 종료한다
        if (left >= right) return;
        // 센티널 분할
        var pivot = partition(nums, left, right);
        // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// 퀵 정렬 클래스(중앙값 피벗 최적화)
const QuickSortMedian = struct {

    // 원소 교환
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 세 후보 원소의 중앙값 선택
    pub fn medianThree(nums: []i32, left: usize, mid: usize, right: usize) usize {
        var l = nums[left];
        var m = nums[mid];
        var r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m은 l과 r 사이에 있다
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l은 m과 r 사이에 있다
        return right;
    }

    // 센티널 분할(세 수의 중앙값 선택)
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 세 후보 원소의 중앙값 선택
        var med = medianThree(nums, left, (left + right) / 2, right);
        // 중앙값을 배열 맨 왼쪽으로 교환하여 옮긴다
        swap(nums, left, med);
        // nums[left]를 피벗으로 삼는다
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            while (i < j and nums[i] <= nums[left]) i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            swap(nums, i, j);   // 두 원소를 교환한다
        }
        swap(nums, i, left);    // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i;               // 피벗의 인덱스를 반환한다
    }

    // 퀵 정렬
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 부분 배열의 길이가 1이면 재귀를 종료한다
        if (left >= right) return;
        // 센티널 분할
        var pivot = partition(nums, left, right);
        if (pivot == 0) return;
        // 왼쪽 부분 배열과 오른쪽 부분 배열에 재귀 호출한다
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// 퀵 정렬 클래스(재귀 깊이 최적화)
const QuickSortTailCall = struct {

    // 원소 교환
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 센티널 분할
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // nums[left]를 피벗으로 삼는다
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 오른쪽에서 왼쪽으로 피벗보다 작은 첫 번째 원소를 찾는다
            while (i < j and nums[i] <= nums[left]) i += 1; // 왼쪽에서 오른쪽으로 피벗보다 큰 첫 번째 원소를 찾는다
            swap(nums, i, j);   // 두 원소를 교환한다
        }
        swap(nums, i, left);    // 피벗을 두 부분 배열의 경계로 교환하여 옮긴다
        return i;               // 피벗의 인덱스를 반환한다
    }

    // 퀵 정렬(재귀 깊이 최적화)
    pub fn quickSort(nums: []i32, left_: usize, right_: usize) void {
        var left = left_;
        var right = right_;
        // 부분 배열의 길이가 1이면 재귀를 종료한다
        while (left < right) {
            // 센티널 분할 연산
            var pivot = partition(nums, left, right);
            // 두 부분 배열 중 더 짧은 쪽에 퀵 정렬을 수행한다
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);   // 왼쪽 부분 배열을 재귀적으로 정렬한다
                left = pivot + 1;                   // 남은 미정렬 구간은 [pivot + 1, right]이다
            } else {
                quickSort(nums, pivot + 1, right);  // 오른쪽 부분 배열을 재귀적으로 정렬한다
                right = pivot - 1;                  // 남은 미정렬 구간은 [left, pivot - 1]이다
            }
        }
    }
};

// 실행 코드
pub fn main() !void {
    // 퀵 정렬
    var nums = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSort.quickSort(&nums, 0, nums.len - 1);
    std.debug.print("퀵 정렬을 마친 후 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    // 퀵 정렬(중앙값 피벗 최적화)
    var nums1 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortMedian.quickSort(&nums1, 0, nums1.len - 1);
    std.debug.print("\n퀵 정렬(중앙값 피벗 최적화) 완료 후 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);

    // 퀵 정렬(재귀 깊이 최적화)
    var nums2 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortTailCall.quickSort(&nums2, 0, nums2.len - 1);
    std.debug.print("\n퀵 정렬(재귀 깊이 최적화) 완료 후 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums2);
    
    _ = try std.io.getStdIn().reader().readByte();
}