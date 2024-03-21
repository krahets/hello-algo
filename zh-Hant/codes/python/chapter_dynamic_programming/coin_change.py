"""
File: coin_change.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def coin_change_dp(coins: list[int], amt: int) -> int:
    """零錢兌換：動態規劃"""
    n = len(coins)
    MAX = amt + 1
    # 初始化 dp 表
    dp = [[0] * (amt + 1) for _ in range(n + 1)]
    # 狀態轉移：首行首列
    for a in range(1, amt + 1):
        dp[0][a] = MAX
    # 狀態轉移：其餘行和列
    for i in range(1, n + 1):
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 若超過目標金額，則不選硬幣 i
                dp[i][a] = dp[i - 1][a]
            else:
                # 不選和選硬幣 i 這兩種方案的較小值
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
    return dp[n][amt] if dp[n][amt] != MAX else -1


def coin_change_dp_comp(coins: list[int], amt: int) -> int:
    """零錢兌換：空間最佳化後的動態規劃"""
    n = len(coins)
    MAX = amt + 1
    # 初始化 dp 表
    dp = [MAX] * (amt + 1)
    dp[0] = 0
    # 狀態轉移
    for i in range(1, n + 1):
        # 正序走訪
        for a in range(1, amt + 1):
            if coins[i - 1] > a:
                # 若超過目標金額，則不選硬幣 i
                dp[a] = dp[a]
            else:
                # 不選和選硬幣 i 這兩種方案的較小值
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
    return dp[amt] if dp[amt] != MAX else -1


"""Driver Code"""
if __name__ == "__main__":
    coins = [1, 2, 5]
    amt = 4

    # 動態規劃
    res = coin_change_dp(coins, amt)
    print(f"湊到目標金額所需的最少硬幣數量為 {res}")

    # 空間最佳化後的動態規劃
    res = coin_change_dp_comp(coins, amt)
    print(f"湊到目標金額所需的最少硬幣數量為 {res}")
