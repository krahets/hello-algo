"""
File: climbing_stairs_dfs_mem.py
Created Time: 2023-06-30
Author: krahets (krahets@163.com)
"""


def dfs(i: int, mem: list[int]) -> int:
    """記憶化搜尋"""
    # 已知 dp[1] 和 dp[2] ，返回之
    if i == 1 or i == 2:
        return i
    # 若存在記錄 dp[i] ，則直接返回之
    if mem[i] != -1:
        return mem[i]
    # dp[i] = dp[i-1] + dp[i-2]
    count = dfs(i - 1, mem) + dfs(i - 2, mem)
    # 記錄 dp[i]
    mem[i] = count
    return count


def climbing_stairs_dfs_mem(n: int) -> int:
    """爬樓梯：記憶化搜尋"""
    # mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
    mem = [-1] * (n + 1)
    return dfs(n, mem)


"""Driver Code"""
if __name__ == "__main__":
    n = 9

    res = climbing_stairs_dfs_mem(n)
    print(f"爬 {n} 階樓梯共有 {res} 種方案")
