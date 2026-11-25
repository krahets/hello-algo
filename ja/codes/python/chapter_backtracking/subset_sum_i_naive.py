"""
File: subset_sum_i_naive.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int],
    target: int,
    total: int,
    choices: list[int],
    res: list[list[int]],
):
    """バックトラッキングによる部分和問題 I"""
    # 部分集合の要素の和が target に等しくなったら解を記録する
    if total == target:
        res.append(list(state))
        return
    # すべての選択肢を調べる
    for i in range(len(choices)):
        # 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
        if total + choices[i] > target:
            continue
        # 試行：選択して要素の和 total を更新する
        state.append(choices[i])
        # 次の選択に進む
        backtrack(state, target, total + choices[i], choices, res)
        # 後戻り：選択を取り消し、元の状態に戻す
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """部分和問題 I を解く（重複する部分集合を含む）"""
    state = []  # 状態（部分集合）
    total = 0  # 部分和
    res = []  # 結果のリスト（部分集合のリスト）
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"入力配列 nums = {nums}, target = {target}")
    print(f"要素の和が {target} となるすべての部分集合 res = {res}")
    print(f"この方法の出力には重複する集合が含まれる点に注意")
