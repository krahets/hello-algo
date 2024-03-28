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
    """分數背包：貪婪"""
    # 建立物品串列，包含兩個屬性：重量、價值
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # 按照單位價值 item.v / item.w 從高到低進行排序
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # 迴圈貪婪選擇
    res = 0
    for item in items:
        if item.w <= cap:
            # 若剩餘容量充足，則將當前物品整個裝進背包
            res += item.v
            cap -= item.w
        else:
            # 若剩餘容量不足，則將當前物品的一部分裝進背包
            res += (item.v / item.w) * cap
            # 已無剩餘容量，因此跳出迴圈
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
    print(f"不超過背包容量的最大物品價值為 {res}")
