"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """원소가 1, 2, ..., n이며 순서가 섞인 배열 생성"""
    # 배열 nums =: 1, 2, 3, ..., n을 생성한다
    nums = [i for i in range(1, n + 1)]
    # 배열 원소를 무작위로 섞는다
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """배열 nums에서 숫자 1이 있는 인덱스 탐색"""
    for i in range(len(nums)):
        # 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
        # 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
        if nums[i] == 1:
            return i
    return -1


"""실행 코드"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\n배열 [ 1, 2, ..., n ]을 섞은 결과 =", nums)
        print("숫자 1의 인덱스", index)
