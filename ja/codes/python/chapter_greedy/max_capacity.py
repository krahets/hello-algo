"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """最大容量（貪欲法）"""
    # i と j を配列の両端に置く
    i, j = 0, len(ht) - 1
    # 最大容量の初期値は 0
    res = 0
    # 両方の板が同じ位置に来るまで貪欲選択を繰り返す
    while i < j:
        # 最大容量を更新する
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # 低い板のポインタを内側へ動かす
        if ht[i] < ht[j]:
            i += 1
        else:
            j -= 1
    return res


"""Driver Code"""
if __name__ == "__main__":
    ht = [3, 8, 5, 2, 7, 7, 3, 4]

    # 貪欲法
    res = max_capacity(ht)
    print(f"最大容量は {res}")
