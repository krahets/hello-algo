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
    # 子集和等於 target 時，記錄解
    if total == target:
        res.append(list(state))
        return
    # 走訪所有選擇
    for i in range(len(choices)):
        # 剪枝：若子集和超過 target ，則跳過該選擇
        if total + choices[i] > target:
            continue
        # 嘗試：做出選擇，更新元素和 total
        state.append(choices[i])
        # 進行下一輪選擇
        backtrack(state, target, total + choices[i], choices, res)
        # 回退：撤銷選擇，恢復到之前的狀態
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """求解子集和 I（包含重複子集）"""
    state = []  # 狀態（子集）
    total = 0  # 子集和
    res = []  # 結果串列（子集串列）
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"輸入陣列 nums = {nums}, target = {target}")
    print(f"所有和等於 {target} 的子集 res = {res}")
    print(f"請注意，該方法輸出的結果包含重複集合")
