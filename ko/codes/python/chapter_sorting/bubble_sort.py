"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """버블 정렬"""
    n = len(nums)
    # 바깥 루프: 미정렬 구간은 [0, i]
    for i in range(n - 1, 0, -1):
        # 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j]와 nums[j + 1] 교환
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """플래그로 최적화한 버블 정렬"""
    n = len(nums)
    # 바깥 루프: 미정렬 구간은 [0, i]
    for i in range(n - 1, 0, -1):
        flag = False  # 플래그 초기화
        # 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j]와 nums[j + 1] 교환
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # 원소가 교환되었음을 기록
        if not flag:
            break  # 이 회전에서 교환이 한 번도 없으면 바로 종료


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("버블 정렬 후 nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("버블 정렬 후 nums =", nums1)
