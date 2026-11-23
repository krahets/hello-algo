"""
File: fractional_knapsack.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""


class Item:
    """品物"""

    def __init__(self, w: int, v: int):
        self.w = w  # 品物の重さ
        self.v = v  # 品物の価値


def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
    """分割可能ナップサック問題：貪欲法"""
    # 重さと価値の 2 つの属性を持つ品物のリストを作成する
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # 単位重さ当たりの価値 item.v / item.w の降順にソートする
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # 貪欲な選択を繰り返す
    res = 0
    for item in items:
        if item.w <= cap:
            # 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v
            cap -= item.w
        else:
            # 残り容量が不足している場合、現在の品物の一部をナップサックに入れる
            res += (item.v / item.w) * cap
            # 残り容量がないため、ループを終了する
            break
    return res


"""実行用コード"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 貪欲アルゴリズム
    res = fractional_knapsack(wgt, val, cap)
    print(f"ナップサックの容量を超えない品物の最大価値は {res}")
