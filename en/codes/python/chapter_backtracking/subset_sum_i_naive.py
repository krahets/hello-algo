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
    # Record a solution when the subset sum equals target
    if total == target:
        res.append(list(state))
        return
    # Iterate over all choices
    for i in range(len(choices)):
        # Prune: skip this choice if the subset sum would exceed target
        if total + choices[i] > target:
            continue
        # Try: make a choice and update the sum total
        state.append(choices[i])
        # Proceed to the next choice
        backtrack(state, target, total + choices[i], choices, res)
        # Backtrack: undo the choice and restore the previous state
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """Solve subset sum I (with duplicate subsets)"""
    state = []  # State (subset)
    total = 0  # Subset sum
    res = []  # Result list (list of subsets)
    backtrack(state, target, total, nums, res)
    return res


"""Driver code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"Input array nums = {nums}, target = {target}")
    print(f"All subsets with sum {target}: res = {res}")
    print(f"Note that this method produces duplicate subsets")
