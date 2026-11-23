"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """계수 정렬"""
    # 간단한 구현이며, 객체 정렬에는 사용할 수 없다
    # 1. 배열의 최댓값 m을 구한다
    m = max(nums)
    # 2. 각 숫자의 등장 횟수를 센다
    # counter[num]은 num의 등장 횟수를 나타낸다
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. counter를 순회하며 각 원소를 원래 배열 nums에 채운다
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """계수 정렬"""
    # 완전한 구현이며, 객체를 정렬할 수 있고 안정 정렬이다
    # 1. 배열의 최댓값 m을 구한다
    m = max(nums)
    # 2. 각 숫자의 등장 횟수를 센다
    # counter[num]은 num의 등장 횟수를 나타낸다
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. counter의 접두 합을 구하여 등장 횟수를 마지막 인덱스로 변환한다
    # 즉, counter[num]-1은 res에서 num이 마지막으로 등장하는 인덱스이다
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. nums를 역순으로 순회하며 각 원소를 결과 배열 res에 채운다
    # 결과를 기록할 배열 res를 초기화한다
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # num을 해당 인덱스에 배치한다
        counter[num] -= 1  # 접두 합을 1 감소시켜 다음에 num을 배치할 인덱스를 구한다
    # 결과 배열 res로 원래 배열 nums를 덮어쓴다
    for i in range(n):
        nums[i] = res[i]


"""실행 코드"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"계수 정렬(객체 정렬 불가)을 마친 후 nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"계수 정렬을 마친 후 nums1 = {nums1}")
