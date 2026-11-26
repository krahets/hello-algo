"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """퀵 정렬 클래스"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """양방향 포인터로 분할"""
        # nums[left]를 피벗으로 선택
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while i < j and nums[i] <= nums[left]:
                i += 1  # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            # 원소 교환
            nums[i], nums[j] = nums[j], nums[i]
        # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 피벗의 인덱스 반환

    def quick_sort(self, nums: list[int], left: int, right: int):
        """퀵 정렬"""
        # 부분 배열의 길이가 1이면 재귀 종료
        if left >= right:
            return
        # 양방향 포인터로 분할
        pivot = self.partition(nums, left, right)
        # 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """퀵 정렬 클래스(중앙값 피벗 최적화)"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """세 후보 원소의 중앙값 선택"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m이 l과 r 사이에 있음
        if (m <= l <= r) or (r <= l <= m):
            return left  # l이 m과 r 사이에 있음
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """양방향 포인터로 분할(세 값의 중앙값 선택)"""
        # nums[left]를 피벗으로 선택
        med = self.median_three(nums, left, (left + right) // 2, right)
        # 교환을 통해 중앙값을 배열의 왼쪽 끝에 배치
        nums[left], nums[med] = nums[med], nums[left]
        # nums[left]를 피벗으로 선택
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while i < j and nums[i] <= nums[left]:
                i += 1  # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            # 원소 교환
            nums[i], nums[j] = nums[j], nums[i]
        # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 피벗의 인덱스 반환

    def quick_sort(self, nums: list[int], left: int, right: int):
        """퀵 정렬"""
        # 부분 배열의 길이가 1이면 재귀 종료
        if left >= right:
            return
        # 양방향 포인터로 분할
        pivot = self.partition(nums, left, right)
        # 왼쪽과 오른쪽 부분 배열을 각각 재귀적으로 정렬
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """퀵 정렬 클래스(재귀 깊이 최적화)"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """양방향 포인터로 분할"""
        # nums[left]를 피벗으로 선택
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # 오른쪽에서 왼쪽으로 피벗보다 작은 첫 원소 찾기
            while i < j and nums[i] <= nums[left]:
                i += 1  # 왼쪽에서 오른쪽으로 피벗보다 큰 첫 원소 찾기
            # 원소 교환
            nums[i], nums[j] = nums[j], nums[i]
        # 교환을 통해 피벗을 두 부분 배열의 경계에 배치
        nums[i], nums[left] = nums[left], nums[i]
        return i  # 피벗의 인덱스 반환

    def quick_sort(self, nums: list[int], left: int, right: int):
        """퀵 정렬(재귀 깊이 최적화)"""
        # 부분 배열의 길이가 1이면 종료
        while left < right:
            # 양방향 포인터로 분할
            pivot = self.partition(nums, left, right)
            # 두 부분 배열 중 더 짧은 쪽에 퀵 정렬 수행
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # 왼쪽 부분 배열 재귀 정렬
                left = pivot + 1  # 남은 미정렬 구간은 [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # 오른쪽 부분 배열 재귀 정렬
                right = pivot - 1  # 남은 미정렬 구간은 [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # 퀵 정렬
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("퀵 정렬 후 nums =", nums)

    # 퀵 정렬(중앙값 피벗 최적화)
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("퀵 정렬(중앙값 피벗 최적화) 후 nums =", nums1)

    # 퀵 정렬(재귀 깊이 최적화)
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("퀵 정렬(재귀 깊이 최적화) 후 nums =", nums2)
