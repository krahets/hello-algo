"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """最大容量：貪婪"""
    # 初始化 i, j，使其分列陣列兩端
    i, j = 0, len(ht) - 1
    # 初始最大容量為 0
    res = 0
    # 迴圈貪婪選擇，直至兩板相遇
    while i < j:
        # 更新最大容量
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # 向內移動短板
        if ht[i] < ht[j]:
            i += 1
        else:
            j -= 1
    return res


"""Driver Code"""
if __name__ == "__main__":
    ht = [3, 8, 5, 2, 7, 7, 3, 4]

    # 貪婪演算法
    res = max_capacity(ht)
    print(f"最大容量為 {res}")
