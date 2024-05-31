"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Backtracking algorithm: Subset Sum I"""
    # When the subset sum equals target, record the solution
    if target == 0:
        res.append(list(state))
        return
    # Traverse all choices
    # Pruning two: start traversing from start to avoid generating duplicate subsets
    for i in range(start, len(choices)):
        # Pruning one: if the subset sum exceeds target, end the loop immediately
        # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if target - choices[i] < 0:
            break
        # Attempt: make a choice, update target, start
        state.append(choices[i])
        # Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i, res)
        # Retract: undo the choice, restore to the previous state
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """Solve Subset Sum I"""
    state = []  # State (subset)
    nums.sort()  # Sort nums
    start = 0  # Start point for traversal
    res = []  # Result list (subset list)
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"Input array nums = {nums}, target = {target}")
    print(f"All subsets equal to {target} res = {res}")
