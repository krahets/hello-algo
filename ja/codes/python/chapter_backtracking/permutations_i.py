"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """バックトラッキング：順列 I"""
    # 状態の長さが要素数に等しければ、解を記録
    if len(state) == len(choices):
        res.append(list(state))
        return
    # すべての選択肢を走査
    for i, choice in enumerate(choices):
        # 枝刈り：要素の重複選択を許可しない
        if not selected[i]:
            # 試行: 選択を行い、状態を更新
            selected[i] = True
            state.append(choice)
            # 次の選択へ進む
            backtrack(state, choices, selected, res)
            # バックトラック：選択を取り消し、前の状態に戻す
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """全順列 I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"入力配列 nums = {nums}")
    print(f"すべての順列 res = {res}")
