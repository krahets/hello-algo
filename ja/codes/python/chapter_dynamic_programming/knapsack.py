"""
File: knapsack.py
Created Time: 2023-07-03
Author: krahets (krahets@163.com)
"""


def knapsack_dfs(wgt: list[int], val: list[int], i: int, c: int) -> int:
    """0-1 ナップサック：ブルートフォース探索"""
    # すべてのアイテムが選択されたかナップサックに残り容量がない場合、値 0 を返す
    if i == 0 or c == 0:
        return 0
    # ナップサック容量を超える場合、ナップサックに入れないことしか選択できない
    if wgt[i - 1] > c:
        return knapsack_dfs(wgt, val, i - 1, c)
    # アイテム i を入れないのと入れるのとの最大値を計算
    no = knapsack_dfs(wgt, val, i - 1, c)
    yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 2 つの選択肢のうち大きい値を返す
    return max(no, yes)


def knapsack_dfs_mem(
    wgt: list[int], val: list[int], mem: list[list[int]], i: int, c: int
) -> int:
    """0-1 ナップサック：記憶化探索"""
    # すべてのアイテムが選択されたかナップサックに残り容量がない場合、値 0 を返す
    if i == 0 or c == 0:
        return 0
    # 記録がある場合、それを返す
    if mem[i][c] != -1:
        return mem[i][c]
    # ナップサック容量を超える場合、ナップサックに入れないことしか選択できない
    if wgt[i - 1] > c:
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    # アイテム i を入れないのと入れるのとの最大値を計算
    no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
    yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
    # 2 つの選択肢のうち大きい値を記録して返す
    mem[i][c] = max(no, yes)
    return mem[i][c]


def knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 ナップサック：動的プログラミング"""
    n = len(wgt)
    # dp テーブルを初期化
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # 状態遷移
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # ナップサック容量を超える場合、アイテム i を選択しない
                dp[i][c] = dp[i - 1][c]
            else:
                # アイテム i を選択しないのと選択するのとで大きい値
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """0-1 ナップサック：空間最適化動的プログラミング"""
    n = len(wgt)
    # dp テーブルを初期化
    dp = [0] * (cap + 1)
    # 状態遷移
    for i in range(1, n + 1):
        # 逆順で走査
        for c in range(cap, 0, -1):
            if wgt[i - 1] > c:
                # ナップサック容量を超える場合、アイテム i を選択しない
                dp[c] = dp[c]
            else:
                # アイテム i を選択しないのと選択するのとで大きい値
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""ドライバーコード"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # ブルートフォース探索
    res = knapsack_dfs(wgt, val, n, cap)
    print(f"ナップサック容量を超えないアイテムの最大値は {res}")

    # 記憶化探索
    mem = [[-1] * (cap + 1) for _ in range(n + 1)]
    res = knapsack_dfs_mem(wgt, val, mem, n, cap)
    print(f"ナップサック容量を超えないアイテムの最大値は {res}")

    # 動的プログラミング
    res = knapsack_dp(wgt, val, cap)
    print(f"ナップサック容量を超えないアイテムの最大値は {res}")

    # 空間最適化動的プログラミング
    res = knapsack_dp_comp(wgt, val, cap)
    print(f"ナップサック容量を超えないアイテムの最大値は {res}")