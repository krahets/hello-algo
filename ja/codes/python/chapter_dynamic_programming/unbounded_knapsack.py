"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """個数制限なしナップサック問題：動的計画法"""
    n = len(wgt)
    # dp テーブルを初期化する
    dp = [[0] * (cap + 1) for _ in range(n + 1)]
    # 状態遷移
    for i in range(1, n + 1):
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 容量を超える場合は品物 i を選ばない
                dp[i][c] = dp[i - 1][c]
            else:
                # 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """個数制限なしナップサック問題：使用メモリを削減した動的計画法"""
    n = len(wgt)
    # dp テーブルを初期化する
    dp = [0] * (cap + 1)
    # 状態遷移
    for i in range(1, n + 1):
        # 昇順に走査する
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # 容量を超える場合は品物 i を選ばない
                dp[c] = dp[c]
            else:
                # 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # 動的計画法
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"容量内でナップサックに入る品物の最大価値は {res}")

    # 使用メモリを削減した動的計画法
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"容量内でナップサックに入る品物の最大価値は {res}")
