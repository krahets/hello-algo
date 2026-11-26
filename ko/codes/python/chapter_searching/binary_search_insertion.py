"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """이진 탐색으로 삽입 위치 찾기(중복 원소가 없는 경우)"""
    i, j = 0, len(nums) - 1  # 닫힌구간 [0, n-1]을 초기화한다.
    while i <= j:
        m = (i + j) // 2  # 중점 인덱스 m을 계산한다.
        if nums[m] < target:
            i = m + 1  # target을 찾을 구간은 [m+1, j]이다.
        elif nums[m] > target:
            j = m - 1  # target을 찾을 구간은 [i, m-1]이다.
        else:
            return m  # target을 찾았으므로 삽입 위치 m을 반환한다.
    # target을 찾지 못했으므로 삽입 위치 i를 반환한다.
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """이진 탐색으로 삽입 위치 찾기(중복 원소가 있는 경우)"""
    i, j = 0, len(nums) - 1  # 닫힌구간 [0, n-1]을 초기화한다.
    while i <= j:
        m = (i + j) // 2  # 중점 인덱스 m을 계산한다.
        if nums[m] < target:
            i = m + 1  # target을 찾을 구간은 [m+1, j]이다.
        elif nums[m] > target:
            j = m - 1  # target을 찾을 구간은 [i, m-1]이다.
        else:
            j = m - 1  # target보다 작은 원소 중 가장 오른쪽 원소를 찾을 구간은 [i, m-1]이다.
    # 삽입 위치 i를 반환한다.
    return i


"""Driver Code"""
if __name__ == "__main__":
    # 중복 원소가 없는 배열
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\n배열 nums = {nums}")
    # 이진 탐색으로 삽입 위치 찾기
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"삽입할 값 = {target} | 삽입 인덱스 = {index}")

    # 중복 원소가 있는 배열
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n배열 nums = {nums}")
    # 이진 탐색으로 삽입 위치 찾기
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"삽입할 값 = {target} | 삽입 인덱스 = {index}")
