"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """階段の上り方：動的計画法"""
    if n == 1 or n == 2:
        return n
    # 部分問題の解を格納する dp テーブルを初期化する
    dp = [0] * (n + 1)
    # 初期状態：最小の部分問題の解を設定する
    dp[1], dp[2] = 1, 2
    # 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """階段の上り方：空間を最適化した動的計画法"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""実行用コード"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通り")

    res = climbing_stairs_dp_comp(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通り")
