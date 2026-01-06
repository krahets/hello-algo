"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """要素 num の k 番目の桁を取得、exp = 10^(k-1)"""
    # k の代わりに exp を渡すことで、ここでコストの高い累乗計算を避けることができる
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """計数ソート（nums の k 番目の桁に基づく）"""
    # 10進数の桁の範囲は 0~9、したがって長さ10のバケット配列が必要
    counter = [0] * 10
    n = len(nums)
    # 数字 0~9 の出現回数を統計
    for i in range(n):
        d = digit(nums[i], exp)  # nums[i] の k 番目の桁を取得、d とする
        counter[d] += 1  # 数字 d の出現回数を統計
    # 前置和を計算し、「出現回数」を「配列インデックス」に変換
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # 逆順に走査し、バケット統計に基づいて各要素を res に配置
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # 配列内の d のインデックス j を取得
        res[j] = nums[i]  # 現在の要素をインデックス j に配置
        counter[d] -= 1  # d の数を1減らす
    # 結果を使用して元の配列 nums を上書き
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """基数ソート"""
    # 配列の最大要素を取得し、最大桁数を判定するために使用
    m = max(nums)
    # 最下位桁から最上位桁まで走査
    exp = 1
    while exp <= m:
        # 配列要素の k 番目の桁に対して計数ソートを実行
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # つまり、exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10


"""ドライバーコード"""
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
    print("基数ソート完了 nums =", nums)