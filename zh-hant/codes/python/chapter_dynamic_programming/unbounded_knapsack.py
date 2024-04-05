"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """完全背包：動態規劃"""
    n = len(wgt)
    # 初始化 dp 表
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # 狀態轉移
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 若超過背包容量，則不選物品 i
                dp[i][c] = dp[i - 1][c]
            else:
                # 不選和選物品 i 這兩種方案的較大值
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """完全背包：空間最佳化後的動態規劃"""
    n = len(wgt)
    # 初始化 dp 表
    dp = [0] * (cap + 1)
    # 狀態轉移
    for i in range(1, n + 1):
        # 正序走訪
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 若超過背包容量，則不選物品 i
                dp[c] = dp[c]
            else:
                # 不選和選物品 i 這兩種方案的較大值
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # 動態規劃
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"不超過背包容量的最大物品價值為 {res}")

    # 空間最佳化後的動態規劃
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"不超過背包容量的最大物品價值為 {res}")
