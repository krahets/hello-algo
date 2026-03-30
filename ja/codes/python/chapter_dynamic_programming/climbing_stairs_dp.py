"""
File: climbing_stairs_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_dp(n: int) -> int:
    """階段登り：動的計画法"""
    if n == 1 or n == 2:
        return n
    # 部分問題の解を保存するために dp テーブルを初期化
    dp = [0] * (n + 1)
    # 初期状態：最小部分問題の解をあらかじめ設定
    dp[1], dp[2] = 1, 2
    # 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for i in range(3, n + 1):
        dp[i] = dp[i - 1] + dp[i - 2]
    return dp[n]


def climbing_stairs_dp_comp(n: int) -> int:
    """階段登り：空間最適化した動的計画法"""
    if n == 1 or n == 2:
        return n
    a, b = 1, 2
    for _ in range(3, n + 1):
        a, b = b, a + b
    return b


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dp(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通りです")

    res = climbing_stairs_dp_comp(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通りです")
