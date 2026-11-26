"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """バックトラッキングによる全順列 I"""
    # 状態の長さが要素数に達したら解を記録する
    if len(state) == len(choices):
        res.append(list(state))
        return
    # すべての選択肢を調べる
    for i, choice in enumerate(choices):
        # 枝刈り：同じ要素は二度選ばない
        if not selected[i]:
            # 試行：選択して状態を更新する
            selected[i] = True
            state.append(choice)
            # 次の選択に進む
            backtrack(state, choices, selected, res)
            # 後戻り：選択を取り消し、元の状態に戻す
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
