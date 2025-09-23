"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """記憶化探索"""
    # 既知の dp[1] と dp[2] は、それらを返す
    if i == 1 or i == 2:
        return i
    # dp[i] の記録がある場合、それを返す
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # dp[i] を記録
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """階段登り：記憶化探索"""
    # mem[i] は i 段目に登る解の総数を記録、-1 は記録なしを意味する
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""ドライバーコード"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"{n} 段登り、合計 {res} 通りの解がある")