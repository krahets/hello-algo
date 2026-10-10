"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """完全ナップサック問題：動的計画法"""
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
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """完全ナップサック問題：空間最適化後の動的計画法"""
    n = len(wgt)
    # dp テーブルを初期化
    dp = [0] * (cap + 1)
    # 状態遷移
    for i in range(1, n + 1):
        # 順方向に走査する
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # ナップサック容量を超えるなら品物 i は選ばない
                dp[c] = dp[c]
            else:
                # 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""Driver Code"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # 動的計画法
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"ナップサック容量を超えない最大価値は {res}")

    # 空間最適化後の動的計画法
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"ナップサック容量を超えない最大価値は {res}")
