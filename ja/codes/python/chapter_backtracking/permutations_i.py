"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """バックトラッキング：すべての順列 I"""
    # 状態の長さが要素数と等しくなったら、解を記録する
    if len(state) == len(choices):
        res.append(list(state))
        return
    # すべての選択肢を走査する
    for i, choice in enumerate(choices):
        # 枝刈り：同じ要素を繰り返し選んではならない
        if not selected[i]:
            # 試行：選択を行い、状態を更新する
            selected[i] = True
            state.append(choice)
            # 次の選択に進む
            backtrack(state, choices, selected, res)
            # 復元：選択を取り消し、以前の状態に戻す
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """すべての順列 I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""実行用コード"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"入力配列 nums = {nums}")
    print(f"すべての順列 res = {res}")
