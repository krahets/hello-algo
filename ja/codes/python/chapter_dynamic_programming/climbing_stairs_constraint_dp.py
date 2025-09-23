"""
File: climbing_stairs_constraint_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_constraint_dp(n: int) -> int:
    """制約付き階段登り：動的プログラミング"""
    if n == 1 or n == 2:
        return 1
    # dp テーブルを初期化、部分問題の解を格納するために使用
    dp = [[0] * 3 for _ in range(n + 1)]
    # 初期状態：最小の部分問題の解を事前設定
    dp[1][1], dp[1][2] = 1, 0
    dp[2][1], dp[2][2] = 0, 1
    # 状態遷移：小さい部分問題から大きい部分問題を段階的に解く
    for i in range(3, n + 1):
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    return dp[n][1] + dp[n][2]


"""ドライバーコード"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_constraint_dp(n)
    print(f"{n} 段登り、合計 {res} 通りの解がある")