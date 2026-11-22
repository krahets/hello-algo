"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """원소에 임의 접근"""
    # 구간 [0, len(nums)-1]에서 숫자 하나를 무작위로 뽑는다
    random_index = random.randint(0, len(nums) - 1)
    # 무작위 원소를 가져와 반환한다
    random_num = nums[random_index]
    return random_num


# Python의 list는 동적 배열이므로 직접 확장할 수 있다
# 학습의 편의를 위해 이 함수에서는 list를 길이가 고정된 배열로 취급한다
def extend(nums: list[int], enlarge: int) -> list[int]:
    """배열 길이 확장"""
    # 길이를 확장한 배열을 초기화한다
    res = [0] * (len(nums) + enlarge)
    # 원래 배열의 모든 원소를 새 배열에 복사한다
    for i in range(len(nums)):
        res[i] = nums[i]
    # 확장한 새 배열을 반환한다
    return res


def insert(nums: list[int], num: int, index: int):
    """배열의 인덱스 index에 원소 num 삽입"""
    # 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # index 위치의 원소에 num을 대입한다
    nums[index] = num


def remove(nums: list[int], index: int):
    """인덱스 index에 있는 원소 삭제"""
    # 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """배열 순회"""
    count = 0
    # 인덱스를 통해 배열을 순회한다
    for i in range(len(nums)):
        count += nums[i]
    # 배열의 원소를 직접 순회한다
    for num in nums:
        count += num
    # 데이터의 인덱스와 원소를 함께 순회한다
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """배열에서 지정한 원소 탐색"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""실행 코드"""
if __name__ == "__main__":
    # 배열 초기화
    arr = [0] * 5
    print("배열 arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("배열 nums =", nums)

    # 임의 접근
    random_num: int = random_access(nums)
    print("nums에서 무작위로 가져온 원소", random_num)

    # 길이 확장
    nums: list[int] = extend(nums, 3)
    print("배열 길이를 8로 확장한 후 nums =", nums)

    # 원소 삽입
    insert(nums, 6, 3)
    print("인덱스 3에 숫자 6을 삽입한 후 nums =", nums)

    # 원소 삭제
    remove(nums, 2)
    print("인덱스 2의 원소를 삭제한 후 nums =", nums)

    # 배열 순회
    traverse(nums)

    # 원소 탐색
    index: int = find(nums, 3)
    print("nums에서 원소 3을 탐색하여 얻은 인덱스 =", index)
