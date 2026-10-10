"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """要素 num の下から k 桁目を取得（exp = 10^(k-1)）"""
    # ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """計数ソート（nums の k 桁目でソート）"""
    # 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
    counter = [0] * 10
    n = len(nums)
    # 0~9 の各数字の出現回数を集計する
    for i in range(n):
        d = digit(nums[i], exp)  # nums[i] の第 k 位を取得し、d とする
        counter[d] += 1  # 数字 d の出現回数を数える
    # 累積和を求め、「出現回数」を「配列インデックス」に変換する
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # d の配列内インデックス j を取得する
        res[j] = nums[i]  # 現在の要素をインデックス j に格納する
        counter[d] -= 1  # d の個数を 1 減らす
    # 結果で元の配列 nums を上書きする
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """基数ソート"""
    # 最大桁数の判定用に配列の最大要素を取得
    m = max(nums)
    # 下位桁から上位桁の順に走査する
    exp = 1
    while exp <= m:
        # 配列要素の k 桁目に対して計数ソートを行う
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # つまり exp = 10^(k-1)
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
    print("基数ソート完了後 nums =", nums)
