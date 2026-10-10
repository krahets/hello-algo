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
    """バックトラッキング：部分和 I"""
    # 部分集合の和が target に等しければ、解を記録
    if total == target:
        res.append(list(state))
        return
    # すべての選択肢を走査
    for i in range(len(choices)):
        # 枝刈り：部分和が target を超える場合はその選択をスキップする
        if total + choices[i] > target:
            continue
        # 試行：選択を行い、要素と total を更新する
        state.append(choices[i])
        # 次の選択へ進む
        backtrack(state, target, total + choices[i], choices, res)
        # バックトラック：選択を取り消し、前の状態に戻す
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """部分和 I を解く（重複部分集合を含む）"""
    state = []  # 状態（部分集合）
    total = 0  # 部分和
    res = []  # 結果リスト（部分集合のリスト）
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"入力配列 nums = {nums}, target = {target}")
    print(f"和が {target} に等しいすべての部分集合 res = {res}")
    print(f"注意: この方法の出力結果には重複する集合が含まれます")
