"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """버블 정렬"""
    n = len(nums)
    # 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in range(n - 1, 0, -1):
        # 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j]와 nums[j + 1]을 교환한다
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """버블 정렬(플래그 최적화)"""
    n = len(nums)
    # 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in range(n - 1, 0, -1):
        flag = False  # 플래그를 초기화한다
        # 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j]와 nums[j + 1]을 교환한다
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # 원소가 교환되었음을 기록한다
        if not flag:
            break  # 이번 버블 과정에서 원소 교환이 없었으므로 바로 종료한다


"""실행 코드"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("버블 정렬을 마친 후 nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("버블 정렬을 마친 후 nums =", nums1)
