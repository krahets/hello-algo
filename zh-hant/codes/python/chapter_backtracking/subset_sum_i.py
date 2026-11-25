"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """回溯演算法：子集和 I"""
    # 子集總和達到目標時，記錄此解
    if target == 0:
        res.append(list(state))
        return
    # 逐一檢查所有選項
    # 剪枝二：從 start 開始走訪，避免產生重複子集
    for i in range(start, len(choices)):
        # 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
        # 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
        if target - choices[i] < 0:
            break
        # 嘗試：做出選擇，更新 target 和 start
        state.append(choices[i])
        # 進入下一輪選擇
        backtrack(state, target - choices[i], choices, i, res)
        # 回溯：撤銷選擇，還原先前的狀態
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """求解子集和 I"""
    state = []  # 狀態（子集）
    nums.sort()  # 將 nums 排序
    start = 0  # 走訪的起點
    res = []  # 結果串列（子集串列）
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"輸入陣列 nums = {nums}, target = {target}")
    print(f"總和等於 {target} 的所有子集 res = {res}")
