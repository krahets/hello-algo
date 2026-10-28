"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """선택 정렬"""
    n = len(nums)
    # 바깥쪽 반복문: 정렬되지 않은 구간은 [i, n-1]이다
    for i in range(n - 1):
        # 안쪽 반복문: 정렬되지 않은 구간의 최솟값을 찾는다
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # 최솟값의 인덱스를 기록한다
        # 이 최솟값과 정렬되지 않은 구간의 첫 원소를 교환한다
        nums[i], nums[k] = nums[k], nums[i]


"""실행 코드"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("선택 정렬을 마친 후 nums =", nums)
