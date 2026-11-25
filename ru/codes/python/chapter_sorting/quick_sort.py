"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """Класс быстрой сортировки"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение двумя указателями"""
        # Выбрать nums[left] опорным элементом
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Справа налево найти первый элемент меньше опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Слева направо найти первый элемент больше опорного
            # Обмен элементов
            nums[i], nums[j] = nums[j], nums[i]
        # Обменом поместить опорный элемент на границу подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка"""
        # Завершить рекурсию при длине подмассива 1
        if left >= right:
            return
        # Разбиение двумя указателями
        pivot = self.partition(nums, left, right)
        # Рекурсивно отсортировать левый и правый подмассивы
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """Класс быстрой сортировки с выбором медианы"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Выбрать медиану трёх кандидатов"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m лежит между l и r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l лежит между m и r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение двумя указателями с выбором медианы трёх"""
        # Выбрать nums[left] опорным элементом
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Обменом поместить медиану в начало массива
        nums[left], nums[med] = nums[med], nums[left]
        # Выбрать nums[left] опорным элементом
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Справа налево найти первый элемент меньше опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Слева направо найти первый элемент больше опорного
            # Обмен элементов
            nums[i], nums[j] = nums[j], nums[i]
        # Обменом поместить опорный элемент на границу подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка"""
        # Завершить рекурсию при длине подмассива 1
        if left >= right:
            return
        # Разбиение двумя указателями
        pivot = self.partition(nums, left, right)
        # Рекурсивно отсортировать левый и правый подмассивы
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """Класс быстрой сортировки с уменьшенной глубиной рекурсии"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение двумя указателями"""
        # Выбрать nums[left] опорным элементом
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Справа налево найти первый элемент меньше опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Слева направо найти первый элемент больше опорного
            # Обмен элементов
            nums[i], nums[j] = nums[j], nums[i]
        # Обменом поместить опорный элемент на границу подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка с уменьшенной глубиной рекурсии"""
        # Завершить обработку при длине подмассива 1
        while left < right:
            # Выполнить разбиение двумя указателями
            pivot = self.partition(nums, left, right)
            # Применить быструю сортировку к более короткому подмассиву
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Рекурсивно отсортировать левый подмассив
                left = pivot + 1  # Оставшийся неотсортированный участок: [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Рекурсивно отсортировать правый подмассив
                right = pivot - 1  # Оставшийся неотсортированный участок: [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # Быстрая сортировка
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("После быстрой сортировки nums =", nums)

    # Быстрая сортировка с выбором медианы в качестве опорного элемента
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("После быстрой сортировки с выбором медианы nums =", nums1)

    # Быстрая сортировка с уменьшенной глубиной рекурсии
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("После быстрой сортировки с уменьшенной глубиной рекурсии nums =", nums2)
