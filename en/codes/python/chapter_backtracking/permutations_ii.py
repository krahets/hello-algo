"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Backtracking: permutations II"""
    # Record a solution when the state contains all the elements
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Try each choice
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # Skip elements already in use and values already tried at this level
        if not selected[i] and choice not in duplicated:
            # Make a choice and update the state
            duplicated.add(choice)  # Track values already tried
            selected[i] = True
            state.append(choice)
            # Make the next choice
            backtrack(state, choices, selected, res)
            # Backtrack: undo the choice to restore the previous state
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """Permutations II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"Input array nums = {nums}")
    print(f"All permutations res = {res}")
