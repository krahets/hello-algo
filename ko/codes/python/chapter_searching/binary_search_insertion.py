"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """삽입 위치의 이진 탐색(중복 원소 없음)"""
    i, j = 0, len(nums) - 1  # 닫힌 구간 [0, n-1]을 초기화한다
    while i <= j:
        m = (i + j) // 2  # 중간 인덱스 m을 계산한다
        if nums[m] < target:
            i = m + 1  # target은 구간 [m+1, j]에 있다
        elif nums[m] > target:
            j = m - 1  # target은 구간 [i, m-1]에 있다
        else:
            return m  # target을 찾았으므로 삽입 위치 m을 반환한다
    # target을 찾지 못했으므로 삽입 위치 i를 반환한다
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """삽입 위치의 이진 탐색(중복 원소 있음)"""
    i, j = 0, len(nums) - 1  # 닫힌 구간 [0, n-1]을 초기화한다
    while i <= j:
        m = (i + j) // 2  # 중간 인덱스 m을 계산한다
        if nums[m] < target:
            i = m + 1  # target은 구간 [m+1, j]에 있다
        elif nums[m] > target:
            j = m - 1  # target은 구간 [i, m-1]에 있다
        else:
            j = m - 1  # target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
    # 삽입 위치 i를 반환한다
    return i


"""실행 코드"""
if __name__ == "__main__":
    # 중복 원소가 없는 배열
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\n배열 nums = {nums}")
    # 삽입 위치의 이진 탐색
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"원소 {target}의 삽입 위치 인덱스는 {index}이다")

    # 중복 원소를 포함하는 배열
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n배열 nums = {nums}")
    # 삽입 위치의 이진 탐색
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"원소 {target}의 삽입 위치 인덱스는 {index}이다")
