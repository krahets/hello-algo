"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """バックトラッキング：部分和 I"""
    # 部分集合の和が target に等しければ、解を記録
    if target == 0:
        res.append(list(state))
        return
    # すべての選択肢を走査
    # 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
    for i in range(start, len(choices)):
        # 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
        # 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
        if target - choices[i] < 0:
            break
        # 試す：選択を行い、target と start を更新
        state.append(choices[i])
        # 次の選択へ進む
        backtrack(state, target - choices[i], choices, i, res)
        # バックトラック：選択を取り消し、前の状態に戻す
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """部分和 I を解く"""
    state = []  # 状態（部分集合）
    nums.sort()  # nums をソート
    start = 0  # 開始点を走査
    res = []  # 結果リスト（部分集合のリスト）
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"入力配列 nums = {nums}, target = {target}")
    print(f"和が {target} に等しいすべての部分集合 res = {res}")
