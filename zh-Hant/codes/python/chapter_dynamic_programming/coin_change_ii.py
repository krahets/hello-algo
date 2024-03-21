"""
File: coin_change_ii.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_ii_dp(coins: list[int], amt: int) -> int:
    """零錢兌換 II：動態規劃"""
    n = len(coins)
    # 初始化 dp 表
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 初始化首列
    for i in range(n + 1):
        dp[i][0] = 1
    # 狀態轉移
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 若超過目標金額，則不選硬幣 i
                dp[i][a] = dp[i - 1][a]
            else:
                # 不選和選硬幣 i 這兩種方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
    return dp[n][amt]


def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
    """零錢兌換 II：空間最佳化後的動態規劃"""
    n = len(coins)
    # 初始化 dp 表
    dp = [0] * (amt + 1)
    dp[0] = 1
    # 狀態轉移
    for i in range(1, n + 1):
        # 正序走訪
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 若超過目標金額，則不選硬幣 i
                dp[a] = dp[a]
            else:
                # 不選和選硬幣 i 這兩種方案之和
                dp[a] = dp[a] + dp[a - coins[i - 1]]
    return dp[amt]


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 5

    # 動態規劃
    res = coin_change_ii_dp(coins, amt)
    print(f"湊出目標金額的硬幣組合數量為 {res}")

    # 空間最佳化後的動態規劃
    res = coin_change_ii_dp_comp(coins, amt)
    print(f"湊出目標金額的硬幣組合數量為 {res}")
