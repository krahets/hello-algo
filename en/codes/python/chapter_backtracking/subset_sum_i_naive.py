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
    """Backtracking: subset sum I"""
    # Record a solution when the subset sums to target
    if total == target:
        res.append(list(state))
        return
    # Try each choice
    for i in range(len(choices)):
        # Prune: skip choices that would take the subset sum over target
        if total + choices[i] > target:
            continue
        # Make a choice and update the running sum total
        state.append(choices[i])
        # Make the next choice
        backtrack(state, target, total + choices[i], choices, res)
        # Backtrack: undo the choice to restore the previous state
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """Solve subset sum I (including duplicate subsets)"""
    state = []  # State (current subset)
    total = 0  # Subset sum
    res = []  # Results (list of subsets)
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"Input array nums = {nums}, target = {target}")
    print(f"Subsets that sum to {target}: res = {res}")
    print(f"This method returns duplicate subsets")
