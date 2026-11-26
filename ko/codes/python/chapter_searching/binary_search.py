"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """이진 탐색(닫힌구간)"""
    # 닫힌구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다.
    i, j = 0, len(nums) - 1
    # 탐색 구간이 빌 때까지 반복한다(i > j이면 빈 구간).
    while i <= j:
        # 파이썬 정수는 메모리가 허용하는 한 커질 수 있으므로 정수 오버플로를 고려할 필요가 없다.
        m = (i + j) // 2  # 중점 인덱스 m을 계산한다.
        if nums[m] < target:
            i = m + 1  # 이 경우 target을 찾을 구간은 [m+1, j]이다.
        elif nums[m] > target:
            j = m - 1  # 이 경우 target을 찾을 구간은 [i, m-1]이다.
        else:
            return m  # 목표 원소를 찾았으므로 그 인덱스를 반환한다.
    return -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다.


def binary_search_lcro(nums: list[int], target: int) -> int:
    """이진 탐색(왼쪽 끝만 포함하는 반열린구간)"""
    # 왼쪽 끝만 포함하는 반열린구간 [0, n)을 초기화한다. i는 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다.
    i, j = 0, len(nums)
    # 탐색 구간이 빌 때까지 반복한다(i = j이면 빈 구간).
    while i < j:
        m = (i + j) // 2  # 중점 인덱스 m을 계산한다.
        if nums[m] < target:
            i = m + 1  # 이 경우 target을 찾을 구간은 [m+1, j)이다.
        elif nums[m] > target:
            j = m  # 이 경우 target을 찾을 구간은 [i, m)이다.
        else:
            return m  # 목표 원소를 찾았으므로 그 인덱스를 반환한다.
    return -1  # 목표 원소를 찾지 못했으므로 -1을 반환한다.


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 이진 탐색(닫힌구간)
    index = binary_search(nums, target)
    print("목표 원소 6의 인덱스 = ", index)

    # 이진 탐색(왼쪽 끝만 포함하는 반열린구간)
    index = binary_search_lcro(nums, target)
    print("목표 원소 6의 인덱스 = ", index)
