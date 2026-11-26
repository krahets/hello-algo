"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """선택 정렬"""
    n = len(nums)
    # 바깥 루프: 미정렬 구간은 [i, n-1]
    for i in range(n - 1):
        # 안쪽 루프: 미정렬 구간에서 최솟값 찾기
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # 최솟값의 인덱스 기록
        # 최솟값과 미정렬 구간의 첫 원소 교환
        nums[i], nums[k] = nums[k], nums[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("선택 정렬 후 nums =", nums)
