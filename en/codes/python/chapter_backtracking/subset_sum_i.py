"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Backtracking: subset sum I"""
    # Record a solution when the remaining target is zero
    if target == 0:
        res.append(list(state))
        return
    # Iterate over all choices
    # Pruning 2: iterate from start to avoid generating duplicate subsets
    for i in range(start, len(choices)):
        # Pruning 1: exit the loop if this choice exceeds the remaining target
        # The array is sorted, so later elements are at least as large and also exceed the remaining target
        if target - choices[i] < 0:
            break
        # Try: make a choice and update target and start
        state.append(choices[i])
        # Proceed to the next choice
        backtrack(state, target - choices[i], choices, i, res)
        # Backtrack: undo the choice and restore the previous state
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """Solve subset sum I"""
    state = []  # State (subset)
    nums.sort()  # Sort nums
    start = 0  # Starting index for iteration
    res = []  # Result list (list of subsets)
    backtrack(state, target, nums, start, res)
    return res


"""Driver code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"Input array nums = {nums}, target = {target}")
    print(f"All subsets with sum {target}: res = {res}")
