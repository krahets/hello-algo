"""
File: edit_distancde.py
Created Time: 2023-07-04
Author: krahets (krahets@163.com)
"""


def edit_distance_dfs(s: str, t: str, i: int, j: int) -> int:
    """編集距離：総当たり探索"""
    # s と t がともに空なら 0 を返す
    if i == 0 and j == 0:
        return 0
    # s が空なら t の長さを返す
    if i == 0:
        return j
    # t が空なら s の長さを返す
    if j == 0:
        return i
    # 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs(s, t, i - 1, j - 1)
    # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    insert = edit_distance_dfs(s, t, i, j - 1)
    delete = edit_distance_dfs(s, t, i - 1, j)
    replace = edit_distance_dfs(s, t, i - 1, j - 1)
    # 最小編集回数を返す
    return min(insert, delete, replace) + 1


def edit_distance_dfs_mem(s: str, t: str, mem: list[list[int]], i: int, j: int) -> int:
    """編集距離：メモ化探索"""
    # s と t がともに空なら 0 を返す
    if i == 0 and j == 0:
        return 0
    # s が空なら t の長さを返す
    if i == 0:
        return j
    # t が空なら s の長さを返す
    if j == 0:
        return i
    # 記録済みなら、それをそのまま返す
    if mem[i][j] != -1:
        return mem[i][j]
    # 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if s[i - 1] == t[j - 1]:
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
    delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
    replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
    # 最小編集回数を記録して返す
    mem[i][j] = min(insert, delete, replace) + 1
    return mem[i][j]


def edit_distance_dp(s: str, t: str) -> int:
    """編集距離：動的計画法"""
    n, m = len(s), len(t)
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    # 状態遷移：先頭行と先頭列
    for i in range(1, n + 1):
        dp[i][0] = i
    for j in range(1, m + 1):
        dp[0][j] = j
    # 状態遷移: 残りの行と列
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if s[i - 1] == t[j - 1]:
                # 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[i][j] = dp[i - 1][j - 1]
            else:
                # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
    return dp[n][m]


def edit_distance_dp_comp(s: str, t: str) -> int:
    """編集距離：空間最適化した動的計画法"""
    n, m = len(s), len(t)
    dp = [0] * (m + 1)
    # 状態遷移：先頭行
    for j in range(1, m + 1):
        dp[j] = j
    # 状態遷移：残りの行
    for i in range(1, n + 1):
        # 状態遷移：先頭列
        leftup = dp[0]  # dp[i-1, j-1] を一時保存する
        dp[0] += 1
        # 状態遷移：残りの列
        for j in range(1, m + 1):
            temp = dp[j]
            if s[i - 1] == t[j - 1]:
                # 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[j] = leftup
            else:
                # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[j] = min(dp[j - 1], dp[j], leftup) + 1
            leftup = temp  # 次の反復の dp[i-1, j-1] に更新する
    return dp[m]


"""Driver Code"""
if __name__ == "__main__":
    s = "bag"
    t = "pack"
    n, m = len(s), len(t)

    # 全探索
    res = edit_distance_dfs(s, t, n, m)
    print(f"{s} を {t} に変更するには最小で {res} 回の編集が必要です")

    # メモ化探索
    mem = [[-1] * (m + 1) for _ in range(n + 1)]
    res = edit_distance_dfs_mem(s, t, mem, n, m)
    print(f"{s} を {t} に変更するには最小で {res} 回の編集が必要です")

    # 動的計画法
    res = edit_distance_dp(s, t)
    print(f"{s} を {t} に変更するには最小で {res} 回の編集が必要です")

    # 空間最適化後の動的計画法
    res = edit_distance_dp_comp(s, t)
    print(f"{s} を {t} に変更するには最小で {res} 回の編集が必要です")
