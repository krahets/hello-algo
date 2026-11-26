"""
File: worst_best_time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_numbers(n: int) -> list[int]:
    """1, 2, ..., n을 원소로 갖는 배열을 만들고 순서를 섞는다"""
    # 원소가 1, 2, 3, ..., n인 배열 nums를 만든다
    nums = [i for i in range(1, n + 1)]
    # 배열의 원소를 무작위로 섞는다
    random.shuffle(nums)
    return nums


def find_one(nums: list[int]) -> int:
    """배열 nums에서 1의 인덱스를 찾는다"""
    for i in range(len(nums)):
        # 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
        # 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
        if nums[i] == 1:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    for i in range(10):
        n = 100
        nums: list[int] = random_numbers(n)
        index: int = find_one(nums)
        print("\n배열 [ 1, 2, ..., n ]을 섞은 결과 =", nums)
        print("숫자 1의 인덱스 =", index)
