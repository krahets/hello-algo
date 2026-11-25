"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """バックトラッキングによる全順列 II"""
    # 状態の長さが要素数に達したら解を記録する
    if len(state) == len(choices):
        res.append(list(state))
        return
    # すべての選択肢を調べる
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
        if not selected[i] and choice not in duplicated:
            # 試行：選択して状態を更新する
            duplicated.add(choice)  # 選んだ要素の値を記録する
            selected[i] = True
            state.append(choice)
            # 次の選択に進む
            backtrack(state, choices, selected, res)
            # 後戻り：選択を取り消し、元の状態に戻す
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """全順列 II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"入力配列 nums = {nums}")
    print(f"すべての順列 res = {res}")
