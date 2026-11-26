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
    """回溯演算法：子集和 I"""
    # 子集總和達到目標時，記錄此解
    if total == target:
        res.append(list(state))
        return
    # 逐一檢查所有選項
    for i in range(len(choices)):
        # 剪枝：若加入該元素後總和超過 target，略過這個選擇
        if total + choices[i] > target:
            continue
        # 嘗試：做出選擇，更新元素總和 total
        state.append(choices[i])
        # 進入下一輪選擇
        backtrack(state, target, total + choices[i], choices, res)
        # 回溯：撤銷選擇，還原先前的狀態
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """求解子集和 I（含重複子集）"""
    state = []  # 狀態（子集）
    total = 0  # 子集總和
    res = []  # 結果串列（子集串列）
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"輸入陣列 nums = {nums}, target = {target}")
    print(f"總和等於 {target} 的所有子集 res = {res}")
    print(f"請注意，這個方法輸出的結果含有重複集合")
