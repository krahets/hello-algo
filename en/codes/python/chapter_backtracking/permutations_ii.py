"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Backtracking: permutations II"""
    # Record a solution when the state length equals the number of elements
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Iterate over all choices
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # Prune: do not reuse an element or choose the same value again at this depth
        if not selected[i] and choice not in duplicated:
            # Try: make a choice and update the state
            duplicated.add(choice)  # Record the chosen value
            selected[i] = True
            state.append(choice)
            # Proceed to the next choice
            backtrack(state, choices, selected, res)
            # Backtrack: undo the choice and restore the previous state
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """Permutations II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"Input array nums = {nums}")
    print(f"All permutations: res = {res}")
