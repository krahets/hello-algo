"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """要素 num の第 k 桁を取得する。exp = 10^(k-1) とする"""
    # k ではなく exp を渡すことで、ここで高コストのべき乗計算を繰り返すのを避ける
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """カウントソート（nums の第 k 桁に基づくソート）"""
    # 十進数の各桁の範囲は 0~9 なので、長さ 10 のバケット配列が必要
    counter = [0] * 10
    n = len(nums)
    # 0~9 の各数字の出現回数を数える
    for i in range(n):
        d = digit(nums[i], exp)  # nums[i] の第 k 桁を取得し、d とする
        counter[d] += 1  # 数字 d の出現回数を数える
    # 累積和を求め、「出現回数」を「配列のインデックス」に変換する
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # 逆順に走査し、バケット内の集計結果に基づいて各要素を res に入れる
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # 配列内での d のインデックス j を取得する
        res[j] = nums[i]  # 現在の要素をインデックス j に入れる
        counter[d] -= 1  # d の個数を 1 減らす
    # 結果で元の配列 nums を上書きする
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """基数ソート"""
    # 最大桁数を判定するため、配列の最大要素を取得する
    m = max(nums)
    # 下位の桁から上位の桁へ順に走査する
    exp = 1
    while exp <= m:
        # 配列の要素の第 k 桁に対してカウントソートを行う
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # つまり exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10


"""実行用コード"""
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
