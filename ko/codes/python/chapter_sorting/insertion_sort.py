"""
File: insertion_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def insertion_sort(nums: list[int]):
    """삽입 정렬"""
    # 바깥 루프: 정렬된 구간은 [0, i-1]
    for i in range(1, len(nums)):
        base = nums[i]
        j = i - 1
        # 안쪽 루프: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입
        while j >= 0 and nums[j] > base:
            nums[j + 1] = nums[j]  # nums[j]를 오른쪽으로 한 칸 이동
            j -= 1
        nums[j + 1] = base  # 올바른 위치에 base 대입


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("삽입 정렬 후 nums =", nums)
