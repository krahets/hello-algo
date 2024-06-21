"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """0-1 背包：暴力搜尋"""
    # 若已選完所有物品或背包無剩餘容量，則返回價值 0
    if i == 0 or c == 0:
        return 0
    # 若超過背包容量，則只能選擇不放入背包
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # 計算不放入和放入物品 i 的最大價值
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 返回兩種方案中價值更大的那一個
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """0-1 背包：記憶化搜尋"""
    # 若已選完所有物品或背包無剩餘容量，則返回價值 0
    if i == 0 or c == 0:
        return 0
    # 若已有記錄，則直接返回
    if mem[i][c] != -1:
        return mem[i][c]
    # 若超過背包容量，則只能選擇不放入背包
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # 計算不放入和放入物品 i 的最大價值
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 記錄並返回兩種方案中價值更大的那一個
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 背包：動態規劃"""
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 背包：空間最佳化後的動態規劃"""
    n = len(wgt)
    # 初始化 dp 表
    dp = [0] * (cap + 1)
    # 狀態轉移
    for i in range(1, n + 1):
        # 倒序走訪
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # 若超過背包容量，則不選物品 i
                dp[c] = dp[c]
            else:
                # 不選和選物品 i 這兩種方案的較大值
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 暴力搜尋
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"不超過背包容量的最大物品價值為 {res}")

    # 記憶化搜尋
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"不超過背包容量的最大物品價值為 {res}")

    # 動態規劃
    res = knapsack_dp(wgt, val, cap)
    print(f"不超過背包容量的最大物品價值為 {res}")

    # 空間最佳化後的動態規劃
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"不超過背包容量的最大物品價值為 {res}")
