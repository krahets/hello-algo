"""
File: subset_sum_ii.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """バックトラッキングによる部分和問題 II"""
    # 部分集合の要素の和が target に等しくなったら解を記録する
    if target == 0:
        res.append(list(state))
        return
    # すべての選択肢を調べる
    # 枝刈り 2：start から調べて部分集合の重複を防ぐ
    # 枝刈り 3：start から調べて同じ要素を二度選ばないようにする
    for i in range(start, len(choices)):
        # 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
        # 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
        if target - choices[i] < 0:
            break
        # 枝刈り 4：左隣の要素と値が等しければ、探索の枝が重複するので飛ばす
        if i > start and choices[i] == choices[i - 1]:
            continue
        # 試行：選択して target と start を更新する
        state.append(choices[i])
        # 次の選択に進む
        backtrack(state, target - choices[i], choices, i + 1, res)
        # 後戻り：選択を取り消し、元の状態に戻す
        state.pop()


def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
    """部分和問題 II を解く"""
    state = []  # 状態（部分集合）
    nums.sort()  # nums をソートする
    start = 0  # 走査の開始位置
    res = []  # 結果のリスト（部分集合のリスト）
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 4, 5]
    target = 9
    res = subset_sum_ii(nums, target)

    print(f"入力配列 nums = {nums}, target = {target}")
    print(f"要素の和が {target} となるすべての部分集合 res = {res}")
