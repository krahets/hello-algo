"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """回溯演算法：全排列 II"""
    # 當狀態長度等於元素數量時，記錄解
    if len(state) == len(choices):
        res.append(list(state))
        return
    # 走訪所有選擇
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # 剪枝：不允許重複選擇元素 且 不允許重複選擇相等元素
        if not selected[i] and choice not in duplicated:
            # 嘗試：做出選擇，更新狀態
            duplicated.add(choice)  # 記錄選擇過的元素值
            selected[i] = True
            state.append(choice)
            # 進行下一輪選擇
            backtrack(state, choices, selected, res)
            # 回退：撤銷選擇，恢復到之前的狀態
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """全排列 II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"輸入陣列 nums = {nums}")
    print(f"所有排列 res = {res}")
