"""
File: climbing_stairs_constraint_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_constraint_dp(n: int) -> int:
    """制約付き階段登り：動的計画法"""
    if n == 1 or n == 2:
        return 1
    # 部分問題の解を保存するために dp テーブルを初期化
    dp = [[0] * 3 for _ in range(n + 1)]
    # 初期状態：最小部分問題の解をあらかじめ設定
    dp[1][1], dp[1][2] = 1, 0
    dp[2][1], dp[2][2] = 0, 1
    # 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for i in range(3, n + 1):
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    return dp[n][1] + dp[n][2]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_constraint_dp(n)
    print(f"{n} 段の階段を上る方法は全部で {res} 通りです")
