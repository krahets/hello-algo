"""
File: fractional_knapsack.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""


class Item:
    """物品"""

    def __init__(self, w: int, v: int):
        self.w = w  # 物品重量
        self.v = v  # 物品價值


def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
    """分數背包：貪婪法"""
    # 建立物品清單，每件物品有重量與價值兩項屬性
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # 依單位價值 item.v / item.w 由高到低排序
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # 反覆依貪婪策略選取物品
    res = 0
    for item in items:
        if item.w <= cap:
            # 若剩餘容量足夠，就將目前的物品整件裝入背包
            res += item.v
            cap -= item.w
        else:
            # 若剩餘容量不足，就將目前物品的一部分裝入背包
            res += (item.v / item.w) * cap
            # 背包已滿，跳出迴圈
            break
    return res


"""Driver Code"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 貪婪演算法
    res = fractional_knapsack(wgt, val, cap)
    print(f"在背包容量限制內，物品的最大總價值為 {res}")
