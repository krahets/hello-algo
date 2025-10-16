"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """定数複雑度"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """線形複雑度"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """線形複雑度（配列の走査）"""
    count = 0
    # ループ回数は配列の長さに比例する
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """二次複雑度"""
    count = 0
    # ループ回数はデータサイズnの二乗に比例する
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """二次複雑度（バブルソート）"""
    count = 0  # カウンタ
    # 外側のループ: 未ソート範囲は [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # 内側のループ: 未ソート範囲 [0, i] の最大要素を右端にスワップ
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j] と nums[j + 1] をスワップ
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # 要素のスワップは3つの個別操作を含む
    return count


def exponential(n: int) -> int:
    """指数複雑度（ループ実装）"""
    count = 0
    base = 1
    # セルは毎回2つに分裂し、1, 2, 4, 8, ..., 2^(n-1) の数列を形成する
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """指数複雑度（再帰実装）"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """対数複雑度（ループ実装）"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """対数複雑度（再帰実装）"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """線形対数複雑度"""
    if n <= 1:
        return 1
    count: int = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """階乗複雑度（再帰実装）"""
    if n == 0:
        return 1
    count = 0
    # 1つからnに分岐
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""ドライバコード"""
if __name__ == "__main__":
    # nを変更して、様々な複雑度での操作回数の変化傾向を体験できる
    n = 8
    print("入力データサイズ n =", n)

    count: int = constant(n)
    print("定数複雑度の操作回数 =", count)

    count: int = linear(n)
    print("線形複雑度の操作回数 =", count)
    count: int = array_traversal([0] * n)
    print("線形複雑度（配列の走査）の操作回数 =", count)

    count: int = quadratic(n)
    print("二次複雑度の操作回数 =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count: int = bubble_sort(nums)
    print("二次複雑度（バブルソート）の操作回数 =", count)

    count: int = exponential(n)
    print("指数複雑度（ループ実装）の操作回数 =", count)
    count: int = exp_recur(n)
    print("指数複雑度（再帰実装）の操作回数 =", count)

    count: int = logarithmic(n)
    print("対数複雑度（ループ実装）の操作回数 =", count)
    count: int = log_recur(n)
    print("対数複雑度（再帰実装）の操作回数 =", count)

    count: int = linear_log_recur(n)
    print("線形対数複雑度（再帰実装）の操作回数 =", count)

    count: int = factorial_recur(n)
    print("階乗複雑度（再帰実装）の操作回数 =", count)