"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """定数オーダー"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """線形オーダー"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """線形オーダー（配列の走査）"""
    count = 0
    # ループの回数は配列の長さに比例する
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """二次オーダー"""
    count = 0
    # ループの回数はデータの大きさ n の二乗に比例する
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """二次オーダー（バブルソート）"""
    count = 0  # カウンタ
    # 外側のループ：未ソート区間は [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j] と nums[j + 1] を交換する
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # 要素の交換は 3 回の単位操作からなる
    return count


def exponential(n: int) -> int:
    """指数オーダー（ループによる実装）"""
    count = 0
    base = 1
    # 各回で細胞が 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """指数オーダー（再帰による実装）"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """対数オーダー（ループによる実装）"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """対数オーダー（再帰による実装）"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """線形対数オーダー"""
    if n <= 1:
        return 1
    # 2 つに分割し、部分問題の大きさを半分にする
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # 現在の部分問題には n 回の操作が含まれる
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """階乗オーダー（再帰による実装）"""
    if n == 0:
        return 1
    count = 0
    # 1 個から n 個に分裂する
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""実行用コード"""
if __name__ == "__main__":
    # n を変更して実行し、各計算量で操作回数がどのように変化するか確かめられる
    n = 8
    print("入力データの大きさ n =", n)

    count = constant(n)
    print("定数オーダーの操作回数 =", count)

    count = linear(n)
    print("線形オーダーの操作回数 =", count)
    count = array_traversal([0] * n)
    print("線形オーダー（配列の走査）の操作回数 =", count)

    count = quadratic(n)
    print("二次オーダーの操作回数 =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("二次オーダー（バブルソート）の操作回数 =", count)

    count = exponential(n)
    print("指数オーダー（ループによる実装）の操作回数 =", count)
    count = exp_recur(n)
    print("指数オーダー（再帰による実装）の操作回数 =", count)

    count = logarithmic(n)
    print("対数オーダー（ループによる実装）の操作回数 =", count)
    count = log_recur(n)
    print("対数オーダー（再帰による実装）の操作回数 =", count)

    count = linear_log_recur(n)
    print("線形対数オーダー（再帰による実装）の操作回数 =", count)

    count = factorial_recur(n)
    print("階乗オーダー（再帰による実装）の操作回数 =", count)
