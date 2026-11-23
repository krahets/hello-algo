"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """왼쪽 부분 배열과 오른쪽 부분 배열 병합"""
    # 왼쪽 부분 배열의 구간은 [left, mid]이고, 오른쪽 부분 배열의 구간은 [mid+1, right]이다
    # 병합 결과를 저장할 임시 배열 tmp를 생성한다
    tmp = [0] * (right - left + 1)
    # 왼쪽 부분 배열과 오른쪽 부분 배열의 시작 인덱스를 초기화한다
    i, j, k = left, mid + 1, 0
    # 양쪽 부분 배열 모두에 원소가 남아 있으면 비교하여 더 작은 원소를 임시 배열에 복사한다
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # 왼쪽 부분 배열과 오른쪽 부분 배열의 남은 원소를 임시 배열에 복사한다
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # 임시 배열 tmp의 원소를 원래 배열 nums의 해당 구간에 다시 복사한다
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """병합 정렬"""
    # 종료 조건
    if left >= right:
        return  # 부분 배열의 길이가 1이면 재귀를 종료한다
    # 분할 단계
    mid = (left + right) // 2 # 중간 위치를 계산한다
    merge_sort(nums, left, mid)  # 왼쪽 부분 배열에 재귀 호출한다
    merge_sort(nums, mid + 1, right)  # 오른쪽 부분 배열에 재귀 호출한다
    # 병합 단계
    merge(nums, left, mid, right)


"""실행 코드"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("병합 정렬을 마친 후 nums =", nums)
