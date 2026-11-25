"""
File: heap_sort.py
Created Time: 2023-05-24
Author: krahets (krahets@163.com)
"""


def sift_down(nums: list[int], n: int, i: int):
    """길이 n인 힙에서 노드 i부터 아래로 내려가며 힙 속성 복원"""
    while True:
        # 노드 i, l, r 중 값이 가장 큰 노드를 ma에 기록
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        if l < n and nums[l] > nums[ma]:
            ma = l
        if r < n and nums[r] > nums[ma]:
            ma = r
        # 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나 더 진행할 필요가 없으면 종료
        if ma == i:
            break
        # 두 노드 교환
        nums[i], nums[ma] = nums[ma], nums[i]
        # 아래로 내려가며 힙 속성 복원 반복
        i = ma


def heap_sort(nums: list[int]):
    """힙 정렬"""
    # 힙 구성: 리프 노드를 제외한 모든 노드에서 힙 속성 복원
    for i in range(len(nums) // 2 - 1, -1, -1):
        sift_down(nums, len(nums), i)
    # 힙에서 최댓값 추출을 n-1회 반복
    for i in range(len(nums) - 1, 0, -1):
        # 루트 노드와 맨 오른쪽 리프 노드 교환(첫 원소와 마지막 원소 교환)
        nums[0], nums[i] = nums[i], nums[0]
        # 루트 노드부터 아래로 내려가며 힙 속성 복원
        sift_down(nums, i, 0)


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    heap_sort(nums)
    print("힙 정렬 후 nums =", nums)
