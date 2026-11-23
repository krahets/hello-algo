"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Backtracking: permutations I"""
    # Record a solution when the state length equals the number of elements
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Iterate over all choices
    for i, choice in enumerate(choices):
        # Prune: do not choose an element more than once
        if not selected[i]:
            # Try: make a choice and update the state
            selected[i] = True
            state.append(choice)
            # Proceed to the next choice
            backtrack(state, choices, selected, res)
            # Backtrack: undo the choice and restore the previous state
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """Permutations I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver code"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"Input array nums = {nums}")
    print(f"All permutations: res = {res}")
