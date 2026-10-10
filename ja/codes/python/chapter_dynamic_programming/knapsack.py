"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """0-1 ナップサック：総当たり探索"""
    # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if i == 0 or c == 0:
        return 0
    # ナップサック容量を超える場合は、入れない選択しかできない
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # 品物 i を入れない場合と入れる場合の最大価値を計算する
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 2つの案のうち価値が大きいほうを返す
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """0-1 ナップサック：メモ化探索"""
    # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if i == 0 or c == 0:
        return 0
    # 既に記録があればそのまま返す
    if mem[i][c] != -1:
        return mem[i][c]
    # ナップサック容量を超える場合は、入れない選択しかできない
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # 品物 i を入れない場合と入れる場合の最大価値を計算する
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 2 つの案のうち価値が大きい方を記録して返す
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 ナップサック：動的計画法"""
    n = len(wgt)
    # dp テーブルを初期化
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # 状態遷移
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # ナップサック容量を超えるなら品物 i は選ばない
                dp[i][c] = dp[i - 1][c]
            else:
                # 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 ナップサック：空間最適化後の動的計画法"""
    n = len(wgt)
    # dp テーブルを初期化
    dp = [0] * (cap + 1)
    # 状態遷移
    for i in range(1, n + 1):
        # 逆順に走査する
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # ナップサック容量を超えるなら品物 i は選ばない
                dp[c] = dp[c]
            else:
                # 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 全探索
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"ナップサック容量を超えない最大価値は {res}")

    # メモ化探索
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"ナップサック容量を超えない最大価値は {res}")

    # 動的計画法
    res = knapsack_dp(wgt, val, cap)
    print(f"ナップサック容量を超えない最大価値は {res}")

    # 空間最適化後の動的計画法
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"ナップサック容量を超えない最大価値は {res}")
