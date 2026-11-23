"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """이진 탐색: 문제 f(i, j)"""
    # 구간이 비어 있으면 목표 원소가 없다는 뜻이므로 -1을 반환한다
    if i > j:
        return -1
    # 중간 인덱스 m을 계산한다
    m = (i + j) // 2
    if nums[m] < target:
        # 부분 문제 f(m+1, j)를 재귀적으로 푼다
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # 부분 문제 f(i, m-1)를 재귀적으로 푼다
        return dfs(nums, target, i, m - 1)
    else:
        # 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        return m


def binary_search(nums: list[int], target: int) -> int:
    """이진 탐색"""
    n = len(nums)
    # 문제 f(0, n-1)을 푼다
    return dfs(nums, target, 0, n - 1)


"""실행 코드"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 이진 탐색(양 끝을 포함하는 닫힌 구간)
    index = binary_search(nums, target)
    print("목표 원소 6의 인덱스 = ", index)
