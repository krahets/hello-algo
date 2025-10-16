"""
File: fractional_knapsack.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""


class Item:
    """アイテム"""

    def __init__(self, w: int, v: int):
        self.w = w  # アイテムの重量
        self.v = v  # アイテムの価値


def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
    """分数ナップサック：貪欲法"""
    # アイテムリストを作成、2 つの属性を含む：重量、価値
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # 単位価値 item.v / item.w で高い順にソート
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # 貪欲選択をループ
    res = 0
    for item in items:
        if item.w <= cap:
            # 残り容量が十分な場合、アイテム全体をナップサックに入れる
            res += item.v
            cap -= item.w
        else:
            # 残り容量が不十分な場合、アイテムの一部をナップサックに入れる
            res += (item.v / item.w) * cap
            # 残り容量がなくなったため、ループを中断
            break
    return res


"""ドライバーコード"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 貪欲アルゴリズム
    res = fractional_knapsack(wgt, val, cap)
    print(f"ナップサック容量を超えないアイテムの最大値は {res}")