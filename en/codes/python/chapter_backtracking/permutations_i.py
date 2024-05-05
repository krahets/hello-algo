"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Backtracking algorithm: Permutation I"""
    # When the state length equals the number of elements, record the solution
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Traverse all choices
    for i, choice in enumerate(choices):
        # Pruning: do not allow repeated selection of elements
        if not selected[i]:
            # Attempt: make a choice, update the state
            selected[i] = True
            state.append(choice)
            # Proceed to the next round of selection
            backtrack(state, choices, selected, res)
            # Retract: undo the choice, restore to the previous state
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """Permutation I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"Input array nums = {nums}")
    print(f"All permutations res = {res}")
