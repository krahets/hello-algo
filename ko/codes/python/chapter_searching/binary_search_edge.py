"""
File: binary_search_edge.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from binary_search_insertion import binary_search_insertion


def binary_search_left_edge(nums: list[int], target: int) -> int:
    """가장 왼쪽에 있는 target을 이진 탐색"""
    # target의 삽입 위치를 찾는 것과 같다
    i = binary_search_insertion(nums, target)
    # target을 찾지 못했으므로 -1을 반환한다
    if i == len(nums) or nums[i] != target:
        return -1
    # target을 찾았으므로 인덱스 i를 반환한다
    return i


def binary_search_right_edge(nums: list[int], target: int) -> int:
    """가장 오른쪽에 있는 target을 이진 탐색"""
    # 가장 왼쪽에 있는 target + 1을 찾는 문제로 바꾼다
    i = binary_search_insertion(nums, target + 1)
    # j는 가장 오른쪽의 target을 가리키고, i는 target보다 큰 첫 번째 원소를 가리킨다
    j = i - 1
    # target을 찾지 못했으므로 -1을 반환한다
    if j == -1 or nums[j] != target:
        return -1
    # target을 찾았으므로 인덱스 j를 반환한다
    return j


"""실행 코드"""
if __name__ == "__main__":
    # 중복 원소를 포함하는 배열
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n배열 nums = {nums}")

    # 왼쪽 경계와 오른쪽 경계의 이진 탐색
    for target in [6, 7]:
        index = binary_search_left_edge(nums, target)
        print(f"가장 왼쪽 원소 {target}의 인덱스는 {index}이다")
        index = binary_search_right_edge(nums, target)
        print(f"가장 오른쪽 원소 {target}의 인덱스는 {index}이다")
