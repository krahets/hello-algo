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
    """백트래킹 알고리즘: 부분 집합 합 I"""
    # 부분 집합의 합이 target과 같으면 해를 기록한다
    if total == target:
        res.append(list(state))
        return
    # 모든 선택지를 순회한다
    for i in range(len(choices)):
        # 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
        if total + choices[i] > target:
            continue
        # 시도: 선택하고 원소의 합 total을 갱신한다
        state.append(choices[i])
        # 다음 선택을 진행한다
        backtrack(state, target, total + choices[i], choices, res)
        # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop()


def subset_sum_i_naive(nums: list[int], target: int) -> list[list[int]]:
    """부분 집합 합 I 풀기(중복 부분 집합 포함)"""
    state = []  # 상태(부분 집합)
    total = 0  # 부분 집합의 합
    res = []  # 결과 리스트(부분 집합 리스트)
    backtrack(state, target, total, nums, res)
    return res


"""실행 코드"""
if __name__ == "__main__":
    nums = [3, 4, 5]
    target = 9
    res = subset_sum_i_naive(nums, target)

    print(f"입력 배열 nums = {nums}, target = {target}")
    print(f"합이 {target}인 모든 부분 집합 res = {res}")
    print(f"이 방법의 출력 결과에는 중복 집합이 포함된다")
