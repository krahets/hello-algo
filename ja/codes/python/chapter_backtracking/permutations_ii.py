"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """バックトラッキングアルゴリズム：順列 II"""
    # 状態の長さが要素数と等しいとき、解を記録
    if len(state) == len(choices):
        res.append(list(state))
        return
    # すべての選択肢を走査
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # 枝刈り：要素の重複選択を許可せず、等しい要素の重複選択も許可しない
        if not selected[i] and choice not in duplicated:
            # 試行：選択を行い、状態を更新
            duplicated.add(choice)  # 選択された要素値を記録
            selected[i] = True
            state.append(choice)
            # 次の選択ラウンドに進む
            backtrack(state, choices, selected, res)
            # 撤回：選択を取り消し、前の状態に復元
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """順列 II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""ドライバーコード"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"入力配列 nums = {nums}")
    print(f"すべての順列 res = {res}")