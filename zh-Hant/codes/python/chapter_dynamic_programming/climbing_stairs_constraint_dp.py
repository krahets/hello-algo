"""
File: climbing_stairs_constraint_dp.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def climbing_stairs_constraint_dp(n: int) -> int:
    """帶約束爬樓梯：動態規劃"""
    if n == 1 or n == 2:
        return 1
    # 初始化 dp 表，用於儲存子問題的解
    dp = [[0] * 3 for _ in range(n + 1)]
    # 初始狀態：預設最小子問題的解
    dp[1][1], dp[1][2] = 1, 0
    dp[2][1], dp[2][2] = 0, 1
    # 狀態轉移：從較小子問題逐步求解較大子問題
    for i in range(3, n + 1):
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    return dp[n][1] + dp[n][2]


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_constraint_dp(n)
    print(f"爬 {n} 階樓梯共有 {res} 種方案")
