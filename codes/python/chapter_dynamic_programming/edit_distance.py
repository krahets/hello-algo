"""
File: edit_distancde.py
Created Time: 2023-07-04
Author: Krahets (krahets@163.com)
"""


def edit_distance_dfs(s: str, t: str, i: int, j: int) -> int:
    """编辑距离：暴力搜索"""
    # 若 s 和 t 都为空，则返回 0
    if i == 0 and j == 0:
        return 0
    # 若 s 为空，则返回 t 长度
    if i == 0:
        return j
    # 若 t 为空，则返回 s 长度
    if j == 0:
        return i
    # 若两字符相等，则直接跳过此两字符
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs(s, t, i - 1, j - 1)
    # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    insert = edit_distance_dfs(s, t, i, j - 1)
    delete = edit_distance_dfs(s, t, i - 1, j)
    replace = edit_distance_dfs(s, t, i - 1, j - 1)
    # 返回最少编辑步数
    return min(insert, delete, replace) + 1


def edit_distance_dfs_mem(s: str, t: str, mem: list[list[int]], i: int, j: int) -> int:
    """编辑距离：记忆化搜索"""
    # 若 s 和 t 都为空，则返回 0
    if i == 0 and j == 0:
        return 0
    # 若 s 为空，则返回 t 长度
    if i == 0:
        return j
    # 若 t 为空，则返回 s 长度
    if j == 0:
        return i
    # 若已有记录，则直接返回之
    if mem[i][j] != -1:
        return mem[i][j]
    # 若两字符相等，则直接跳过此两字符
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 记录并返回最少编辑步数
    mem[i][j] = min(insert, delete, replace) + 1
    return mem[i][j]


def edit_distance_dp(s: str, t: str) -> int:
    """编辑距离：动态规划"""
    n, m = len(s), len(t)
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    # 状态转移：首行首列
    for i in range(1, n + 1):
        dp[i][0] = i
    for j in range(1, m + 1):
        dp[0][j] = j
    # 状态转移：其余行列
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if s[i - 1] == t[j - 1]:
                # 若两字符相等，则直接跳过此两字符
                dp[i][j] = dp[i - 1][j - 1]
            else:
                # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
    return dp[n][m]


def edit_distance_dp_comp(s: str, t: str) -> int:
    """编辑距离：空间优化后的动态规划"""
    n, m = len(s), len(t)
    dp = [0] * (m + 1)
    # 状态转移：首行
    for j in range(1, m + 1):
        dp[j] = j
    # 状态转移：其余行
    for i in range(1, n + 1):
        # 状态转移：首列
        leftup = dp[0]  # 暂存 dp[i-1, j-1]
        dp[0] += 1
        # 状态转移：其余列
        for j in range(1, m + 1):
            temp = dp[j]
            if s[i - 1] == t[j - 1]:
                # 若两字符相等，则直接跳过此两字符
                dp[j] = leftup
            else:
                # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[j] = min(dp[j - 1], dp[j], leftup) + 1
            leftup = temp  # 更新为下一轮的 dp[i-1, j-1]
    return dp[m]


"""Driver Code"""
if __name__ == "__main__":
    s = "bag"
    t = "pack"
    n, m = len(s), len(t)

    # 暴力搜索
    res = edit_distance_dfs(s, t, n, m)
    print(f"将 {s} 更改为 {t} 最少需要编辑 {res} 步")

    # 记忆化搜索
    mem = [[-1] * (m + 1) for _ in range(n + 1)]
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(f"将 {s} 更改为 {t} 最少需要编辑 {res} 步")

    # 动态规划
    res = edit_distance_dp(s, t)
    print(f"将 {s} 更改为 {t} 最少需要编辑 {res} 步")

    # 空间优化后的动态规划
    res = edit_distance_dp_comp(s, t)
    print(f"将 {s} 更改为 {t} 最少需要编辑 {res} 步")
