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
    """Backtracking algorithm: Subset Sum I"""
    # When the subset sum equals target, record the solution
    if total == target:
        res.append(list(state))
        return
    # Traverse all choices
    for i in range(len(choices)):
        # Pruning: if the subset sum exceeds target, skip that choice
        if total + choices[i] > target:
            continue
        # Attempt: make a choice, update elements and total
        state.append(choices[i])
        # Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res)
        # Retract: undo the choice, restore to the previous state
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """Solve Subset Sum I (including duplicate subsets)"""
    state = []  # State (subset)
    total = 0  # Subset sum
    res = []  # Result list (subset list)
    backtrack(state, target, total, nums, res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"Input array nums = {nums}, target = {target}")
    print(f"All subsets equal to {target} res = {res}")
    print(f"The result of this method includes duplicate sets")
