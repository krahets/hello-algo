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
    """バックトラッキングアルゴリズム：部分集合の和 I"""
    # 部分集合の和が target と等しいとき、解を記録
    if total == target:
        res.append(list(state))
        return
    # すべての選択肢を走査
    for i in range(len(choices)):
        # 枝刈り：部分集合の和が target を超える場合、その選択をスキップ
        if total + choices[i] > target:
            continue
        # 試行：選択を行い、要素と total を更新
        state.append(choices[i])
        # 次の選択ラウンドに進む
        backtrack(state, target, total + choices[i], choices, res)
        # 撤回：選択を取り消し、前の状態に復元
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """部分集合の和 I を解く（重複する部分集合を含む）"""
    state = []  # 状態（部分集合）
    total = 0  # 部分集合の和
    res = []  # 結果リスト（部分集合リスト）
    backtrack(state, target, total, nums, res)
    return res


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"入力配列 nums = {nums}, target = {target}")
    print(f"{target} と等しいすべての部分集合 res = {res}")
    print(f"この方法の結果には重複する集合が含まれる")