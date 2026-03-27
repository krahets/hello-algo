"""
File: two_sum.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
    """Метод 1: полный перебор"""
    # Два вложенных цикла, временная сложность O(n^2)
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []


def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
    """Метод 2: вспомогательная хеш-таблица"""
    # Вспомогательная хеш-таблица, пространственная сложность O(n)
    dic = {}
    # Один цикл, временная сложность O(n)
    for i in range(len(nums)):
        if target - nums[i] in dic:
            return [dic[target - nums[i]], i]
        dic[nums[i]] = i
    return []


"""Driver Code"""
if __name__ == "__main__":
    # ======= Test Case =======
    nums = [2, 7, 11, 15]
    target = 13

    # ====== Основной код ======
    # Метод 1
    res: list[int] = two_sum_brute_force(nums, target)
    print("Результат метода 1 res =", res)
    # Метод 2
    res: list[int] = two_sum_hash_table(nums, target)
    print("Результат метода 2 res =", res)
