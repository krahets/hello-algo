"""
File: unbounded_knapsack.py
Created Time: 2023-07-10
Author: krahets (krahets@163.com)
"""


def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
    """完全ナップサック：動的プログラミング"""
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
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
    return dp[n][cap]


def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
    """完全ナップサック：空間最適化動的プログラミング"""
    n = len(wgt)
    # dp テーブルを初期化
    dp = [0] * (cap + 1)
    # 状態遷移
    for i in range(1, n + 1):
        # 順序で走査
        for c in range(1, cap + 1):
            if wgt[i - 1] > c:
                # ナップサック容量を超える場合、アイテム i を選択しない
                dp[c] = dp[c]
            else:
                # アイテム i を選択しないのと選択するのとで大きい値
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
    return dp[cap]


"""ドライバーコード"""
if __name__ == "__main__":
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4

    # 動的プログラミング
    res = unbounded_knapsack_dp(wgt, val, cap)
    print(f"ナップサック容量を超えないアイテムの最大値は {res}")

    # 空間最適化動的プログラミング
    res = unbounded_knapsack_dp_comp(wgt, val, cap)
    print(f"ナップサック容量を超えないアイテムの最大値は {res}")