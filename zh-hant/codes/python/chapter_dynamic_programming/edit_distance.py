"""
File: edit_distancde.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""


def edit_distance_dfs(s: str, t: str, i: int, j: int) -> int:
    """編輯距離：暴力搜尋"""
    # 若 s 和 t 都為空，則返回 0
    if i == 0 and j == 0:
        return 0
    # 若 s 為空，則返回 t 長度
    if i == 0:
        return j
    # 若 t 為空，則返回 s 長度
    if j == 0:
        return i
    # 若兩字元相等，則直接跳過此兩字元
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs(s, t, i - 1, j - 1)
    # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    insert = edit_distance_dfs(s, t, i, j - 1)
    delete = edit_distance_dfs(s, t, i - 1, j)
    replace = edit_distance_dfs(s, t, i - 1, j - 1)
    # 返回最少編輯步數
    return min(insert, delete, replace) + 1


def edit_distance_dfs_mem(s: str, t: str, mem: list[list[int]], i: int, j: int) -> int:
    """編輯距離：記憶化搜尋"""
    # 若 s 和 t 都為空，則返回 0
    if i == 0 and j == 0:
        return 0
    # 若 s 為空，則返回 t 長度
    if i == 0:
        return j
    # 若 t 為空，則返回 s 長度
    if j == 0:
        return i
    # 若已有記錄，則直接返回之
    if mem[i][j] != -1:
        return mem[i][j]
    # 若兩字元相等，則直接跳過此兩字元
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 記錄並返回最少編輯步數
    mem[i][j] = min(insert, delete, replace) + 1
    return mem[i][j]


def edit_distance_dp(s: str, t: str) -> int:
    """編輯距離：動態規劃"""
    n, m = len(s), len(t)
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    # 狀態轉移：首行首列
    for i in range(1, n + 1):
        dp[i][0] = i
    for j in range(1, m + 1):
        dp[0][j] = j
    # 狀態轉移：其餘行和列
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if s[i - 1] == t[j - 1]:
                # 若兩字元相等，則直接跳過此兩字元
                dp[i][j] = dp[i - 1][j - 1]
            else:
                # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
    return dp[n][m]


def edit_distance_dp_comp(s: str, t: str) -> int:
    """編輯距離：空間最佳化後的動態規劃"""
    n, m = len(s), len(t)
    dp = [0] * (m + 1)
    # 狀態轉移：首行
    for j in range(1, m + 1):
        dp[j] = j
    # 狀態轉移：其餘行
    for i in range(1, n + 1):
        # 狀態轉移：首列
        leftup = dp[0]  # 暫存 dp[i-1, j-1]
        dp[0] += 1
        # 狀態轉移：其餘列
        for j in range(1, m + 1):
            temp = dp[j]
            if s[i - 1] == t[j - 1]:
                # 若兩字元相等，則直接跳過此兩字元
                dp[j] = leftup
            else:
                # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[j] = min(dp[j - 1], dp[j], leftup) + 1
            leftup = temp  # 更新為下一輪的 dp[i-1, j-1]
    return dp[m]


"""Driver Code"""
if __name__ == "__main__":
    s = "bag"
    t = "pack"
    n, m = len(s), len(t)

    # 暴力搜尋
    res = edit_distance_dfs(s, t, n, m)
    print(f"將 {s} 更改為 {t} 最少需要編輯 {res} 步")

    # 記憶化搜尋
    mem = [[-1] * (m + 1) for _ in range(n + 1)]
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(f"將 {s} 更改為 {t} 最少需要編輯 {res} 步")

    # 動態規劃
    res = edit_distance_dp(s, t)
    print(f"將 {s} 更改為 {t} 最少需要編輯 {res} 步")

    # 空間最佳化後的動態規劃
    res = edit_distance_dp_comp(s, t)
    print(f"將 {s} 更改為 {t} 最少需要編輯 {res} 步")
