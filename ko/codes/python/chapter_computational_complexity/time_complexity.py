"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """상수 차수"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """선형 차수"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """선형 차수(배열 순회)"""
    count = 0
    # 반복 횟수는 배열 길이에 비례한다
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """이차 차수"""
    count = 0
    # 반복 횟수는 데이터 크기 n의 제곱에 비례한다
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """이차 차수(버블 정렬)"""
    count = 0  # 카운터
    # 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in range(len(nums) - 1, 0, -1):
        # 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # nums[j]와 nums[j + 1]의 값을 맞바꾼다
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
    return count


def exponential(n: int) -> int:
    """지수 차수(반복 구현)"""
    count = 0
    base = 1
    # 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """지수 차수(재귀 구현)"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """로그 차수(반복 구현)"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """로그 차수(재귀 구현)"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """선형 로그 차수"""
    if n <= 1:
        return 1
    # 둘로 나누면 부분 문제의 크기가 절반으로 줄어든다
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # 현재 부분 문제에는 연산 n회가 필요하다
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """팩토리얼 차수(재귀 구현)"""
    if n == 0:
        return 1
    count = 0
    # 하나가 n개로 나뉜다
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
    n = 8
    print("입력 크기 n =", n)

    count = constant(n)
    print("상수 차수 연산 횟수 =", count)

    count = linear(n)
    print("선형 차수 연산 횟수 =", count)
    count = array_traversal([0] * n)
    print("선형 차수(배열 순회) 연산 횟수 =", count)

    count = quadratic(n)
    print("이차 차수 연산 횟수 =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("이차 차수(버블 정렬) 연산 횟수 =", count)

    count = exponential(n)
    print("지수 차수(반복 구현) 연산 횟수 =", count)
    count = exp_recur(n)
    print("지수 차수(재귀 구현) 연산 횟수 =", count)

    count = logarithmic(n)
    print("로그 차수(반복 구현) 연산 횟수 =", count)
    count = log_recur(n)
    print("로그 차수(재귀 구현) 연산 횟수 =", count)

    count = linear_log_recur(n)
    print("선형 로그 차수(재귀 구현) 연산 횟수 =", count)

    count = factorial_recur(n)
    print("팩토리얼 차수(재귀 구현) 연산 횟수 =", count)
