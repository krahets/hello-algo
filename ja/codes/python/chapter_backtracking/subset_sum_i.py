"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """バックトラッキングアルゴリズム：部分集合の和 I"""
    # 部分集合の和が target と等しいとき、解を記録
    if target == 0:
        res.append(list(state))
        return
    # すべての選択肢を走査
    # 枝刈り二：start から走査を開始して重複する部分集合の生成を避ける
    for i in range(start, len(choices)):
        # 枝刈り一：部分集合の和が target を超える場合、直ちにループを終了
        # これは配列がソートされており、後の要素がより大きいため、部分集合の和は必ず target を超えるため
        if target - choices[i] < 0:
            break
        # 試行：選択を行い、target、start を更新
        state.append(choices[i])
        # 次の選択ラウンドに進む
        backtrack(state, target - choices[i], choices, i, res)
        # 撤回：選択を取り消し、前の状態に復元
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """部分集合の和 I を解く"""
    state = []  # 状態（部分集合）
    nums.sort()  # nums をソート
    start = 0  # 走査の開始点
    res = []  # 結果リスト（部分集合リスト）
    backtrack(state, target, nums, start, res)
    return res


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"入力配列 nums = {nums}, target = {target}")
    print(f"{target} と等しいすべての部分集合 res = {res}")