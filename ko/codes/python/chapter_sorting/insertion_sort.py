"""
File: insertion_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def insertion_sort(nums: list[int]):
    """삽입 정렬"""
    # 바깥쪽 반복문: 정렬된 구간은 [0, i-1]이다
    for i in range(1, len(nums)):
        base = nums[i]
        j = i - 1
        # 안쪽 반복문: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입한다
        while j >= 0 and nums[j] > base:
            nums[j + 1] = nums[j]  # nums[j]를 오른쪽으로 한 칸 이동한다
            j -= 1
        nums[j + 1] = base  # 올바른 위치에 base를 대입한다


"""실행 코드"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("삽입 정렬을 마친 후 nums =", nums)
