"""
File: subset_sum_ii.py
Created Time: 2023-06-17
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], target: int, choices: list[int], start: int, res: list[list[int]]
):
    """백트래킹 알고리즘: 부분 집합 합 II"""
    # 부분 집합의 합이 target과 같으면 해를 기록한다
    if target == 0:
        res.append(list(state))
        return
    # 모든 선택지를 순회한다
    # 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
    # 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
    for i in range(start, len(choices)):
        # 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        # 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        if target - choices[i] < 0:
            break
        # 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
        if i > start and choices[i] == choices[i - 1]:
            continue
        # 시도: 선택하고 target, start를 갱신한다
        state.append(choices[i])
        # 다음 선택을 진행한다
        backtrack(state, target - choices[i], choices, i + 1, res)
        # 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        state.pop()


def subset_sum_ii(nums: list[int], target: int) -> list[list[int]]:
    """부분 집합 합 II 풀기"""
    state = []  # 상태(부분 집합)
    nums.sort()  # nums를 정렬한다
    start = 0  # 순회 시작 위치
    res = []  # 결과 리스트(부분 집합 리스트)
    backtrack(state, target, nums, start, res)
    return res


"""실행 코드"""
if __name__ == "__main__":
    nums = [4, 4, 5]
    target = 9
    res = subset_sum_ii(nums, target)

    print(f"입력 배열 nums = {nums}, target = {target}")
    print(f"합이 {target}인 모든 부분 집합 res = {res}")
