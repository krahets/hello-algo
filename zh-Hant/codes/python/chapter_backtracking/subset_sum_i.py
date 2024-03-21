"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """回溯演算法：子集和 I"""
    # 子集和等於 target 時，記錄解
    if target == 0:
        res.append(list(state))
        return
    # 走訪所有選擇
    # 剪枝二：從 start 開始走訪，避免生成重複子集
    for i in range(start, len(choices)):
        # 剪枝一：若子集和超過 target ，則直接結束迴圈
        # 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if target - choices[i] < 0:
            break
        # 嘗試：做出選擇，更新 target, start
        state.append(choices[i])
        # 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i, res)
        # 回退：撤銷選擇，恢復到之前的狀態
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """求解子集和 I"""
    state = []  # 狀態（子集）
    nums.sort()  # 對 nums 進行排序
    start = 0  # 走訪起始點
    res = []  # 結果串列（子集串列）
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"輸入陣列 nums = {nums}, target = {target}")
    print(f"所有和等於 {target} 的子集 res = {res}")
