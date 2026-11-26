"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """要素 num の下から k 桁目を取得。ここで exp = 10^(k-1)"""
    # k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """カウントソート（nums の下から k 桁目でソート）"""
    # 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
    counter = [0] * 10
    n = len(nums)
    # 0～9 の各数字の出現回数を数える
    for i in range(n):
        d = digit(nums[i], exp)  # nums[i] の下から k 桁目を d とする
        counter[d] += 1  # 数字 d の出現回数を数える
    # 累積和を求め、出現回数を配列のインデックスに対応する値に変換
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # 配列内での d のインデックス j を求める
        res[j] = nums[i]  # 現在の要素をインデックス j に書き込む
        counter[d] -= 1  # d の個数を 1 減らす
    # 結果で元の配列 nums を上書き
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """基数ソート"""
    # 配列の最大値から最大桁数を求める
    m = max(nums)
    # 下位桁から上位桁へ順に走査
    exp = 1
    while exp <= m:
        # 配列要素の下から k 桁目にカウントソートを適用
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # すなわち exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10


"""Driver Code"""
if __name__ == "__main__":
    # 基数ソート
    nums = [
        10546151,
        35663510,
        42865989,
        34862445,
        81883077,
        88906420,
        72429244,
        30524779,
        82060337,
        63832996,
    ]
    radix_sort(nums)
    print("基数ソート後の nums =", nums)
