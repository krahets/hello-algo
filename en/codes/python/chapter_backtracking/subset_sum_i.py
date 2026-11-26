"""
File: subset_sum_i.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """Backtracking: subset sum I"""
    # Record a solution when the subset sums to target
    if target == 0:
        res.append(list(state))
        return
    # Try each choice
    # Pruning rule 2: start at start to avoid duplicate subsets
    for i in range(start, len(choices)):
        # Pruning rule 1: break if the subset sum would exceed target
        # The array is sorted, so later elements are at least as large and would also take the sum over target
        if target - choices[i] < 0:
            break
        # Make a choice and update target and start
        state.append(choices[i])
        # Make the next choice
        backtrack(state, target - choices[i], choices, i, res)
        # Backtrack: undo the choice to restore the previous state
        state.pop()


def subset_sum_i(nums: list[int], target: int) -> list[list[int]]:
    """Solve subset sum I"""
    state = []  # State (current subset)
    nums.sort()  # Sort nums
    start = 0  # Starting index
    res = []  # Results (list of subsets)
    backtrack(state, target, nums, start, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i(nums, target)

    print(f"Input array nums = {nums}, target = {target}")
    print(f"Subsets that sum to {target}: res = {res}")
