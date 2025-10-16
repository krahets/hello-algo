"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """最大容量：貪欲法"""
    # i、j を初期化、配列の両端で分割させる
    i, j = 0, len(ht) - 1
    # 初期最大容量は 0
    res = 0
    # 2 つの板が出会うまで貪欲選択をループ
    while i < j:
        # 最大容量を更新
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # 短い板を内側に移動
        if ht[i] < ht[j]:
            i += 1
        else:
            j -= 1
    return res


"""ドライバーコード"""
if __name__ == "__main__":
    ht = [3, 8, 5, 2, 7, 7, 3, 4]

    # 貪欲アルゴリズム
    res = max_capacity(ht)
    print(f"最大容量は {res}")