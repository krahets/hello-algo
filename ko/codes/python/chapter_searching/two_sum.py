"""
File: two_sum.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
    """방법 1: 완전 열거"""
    # 이중 반복문이며 시간 복잡도는 O(n^2)이다
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []


def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
    """방법 2: 보조 해시 테이블"""
    # 보조 해시 테이블의 공간 복잡도는 O(n)이다
    dic = {}
    # 단일 반복문이며 시간 복잡도는 O(n)이다
    for i in range(len(nums)):
        if target - nums[i] in dic:
            return [dic[target - nums[i]], i]
        dic[nums[i]] = i
    return []


"""실행 코드"""
if __name__ == "__main__":
    # ======= 테스트 사례 =======
    nums = [2, 7, 11, 15]
    target = 13

    # ====== 실행 코드 ======
    # 방법 1
    res: list[int] = two_sum_brute_force(nums, target)
    print("방법 1 res =", res)
    # 방법 2
    res: list[int] = two_sum_hash_table(nums, target)
    print("방법 2 res =", res)
