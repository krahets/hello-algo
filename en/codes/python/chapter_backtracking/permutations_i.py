"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Backtracking: permutations I"""
    # Record a solution when the state contains all the elements
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Try each choice
    for i, choice in enumerate(choices):
        # Prune: skip elements already in use
        if not selected[i]:
            # Make a choice and update the state
            selected[i] = True
            state.append(choice)
            # Make the next choice
            backtrack(state, choices, selected, res)
            # Backtrack: undo the choice to restore the previous state
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """Permutations I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"Input array nums = {nums}")
    print(f"All permutations res = {res}")
