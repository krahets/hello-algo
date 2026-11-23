"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """백트래킹 알고리즘: 모든 순열 I"""
    # 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if len(state) == len(choices):
        res.append(list(state))
        return
    # 모든 선택지를 순회한다
    for i, choice in enumerate(choices):
        # 가지치기: 원소를 중복하여 선택할 수 없다
        if not selected[i]:
            # 시도: 선택하고 상태를 갱신한다
            selected[i] = True
            state.append(choice)
            # 다음 선택을 진행한다
            backtrack(state, choices, selected, res)
            # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """모든 순열 I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""실행 코드"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"입력 배열 nums = {nums}")
    print(f"모든 순열 res = {res}")
