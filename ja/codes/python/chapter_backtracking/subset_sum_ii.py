"""
File: subset_sum_ii.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """バックトラッキング：部分集合和 II"""
    # 部分集合の和が target と等しくなったら、解を記録する
    if target == 0:
        res.append(list(state))
        return
    # すべての選択肢を走査する
    # 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
    # 枝刈り 3：start から走査を始め、同じ要素の再選択を避ける
    for i in range(start, len(choices)):
        # 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
        # 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
        if target - choices[i] < 0:
            break
        # 枝刈り 4：この要素が左隣の要素と等しい場合、探索の分岐が重複するため、直ちにスキップする
        if i > start and choices[i] == choices[i - 1]:
            continue
        # 試行：選択を行い、target, start を更新する
        state.append(choices[i])
        # 次の選択に進む
        backtrack(state, target - choices[i], choices, i + 1, res)
        # 復元：選択を取り消し、以前の状態に戻す
        state.pop()


def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
    """部分集合和 II を解く"""
    state = []  # 状態（部分集合）
    nums.sort()  # nums をソートする
    start = 0  # 走査の開始位置
    res = []  # 結果リスト（部分集合のリスト）
    backtrack(state, target, nums, start, res)
    return res


"""実行用コード"""
if __name__ == "__main__":
    nums = [4, 4, 5]
    target = 9
    res = subset_sum_ii(nums, target)

    print(f"入力配列 nums = {nums}, target = {target}")
    print(f"和が {target} になるすべての部分集合 res = {res}")
