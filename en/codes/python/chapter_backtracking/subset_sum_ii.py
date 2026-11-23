"""
File: subset_sum_ii.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Backtracking: subset sum II"""
    # Record a solution when the remaining target is zero
    if target == 0:
        res.append(list(state))
        return
    # Iterate over all choices
    # Pruning 2: iterate from start to avoid generating duplicate subsets
    # Pruning 3: start after the previously chosen index to avoid choosing the same element again
    for i in range(start, len(choices)):
        # Pruning 1: exit the loop if this choice exceeds the remaining target
        # The array is sorted, so later elements are at least as large and also exceed the remaining target
        if target - choices[i] < 0:
            break
        # Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
        if i > start and choices[i] == choices[i - 1]:
            continue
        # Try: make a choice and update target and start
        state.append(choices[i])
        # Proceed to the next choice
        backtrack(state, target - choices[i], choices, i + 1, res)
        # Backtrack: undo the choice and restore the previous state
        state.pop()


def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
    """Solve subset sum II"""
    state = []  # State (subset)
    nums.sort()  # Sort nums
    start = 0  # Starting index for iteration
    res = []  # Result list (list of subsets)
    backtrack(state, target, nums, start, res)
    return res


"""Driver code"""
if __name__ == "__main__":
    nums = [4, 4, 5]
    target = 9
    res = subset_sum_ii(nums, target)

    print(f"Input array nums = {nums}, target = {target}")
    print(f"All subsets with sum {target}: res = {res}")
