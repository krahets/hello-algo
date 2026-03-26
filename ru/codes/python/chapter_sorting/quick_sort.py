"""
File: quick_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


class QuickSort:
    """Класс быстрой сортировки"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение методом двух указателей"""
        # Взять nums[left] в качестве опорного элемента
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Искать справа налево первый элемент, меньший опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Искать слева направо первый элемент, больший опорного
            # Поменять элементы местами
            nums[i], nums[j] = nums[j], nums[i]
        # Переместить опорный элемент на границу двух подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка"""
        # Завершить рекурсию, когда длина подмассива равна 1
        if left >= right:
            return
        # Разбиение методом двух указателей
        pivot = self.partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortMedian:
    """Класс быстрой сортировки (оптимизация медианным опорным элементом)"""

    def median_three(self, nums: list[int], left: int, mid: int, right: int) -> int:
        """Выбрать медиану из трех кандидатов"""
        l, m, r = nums[left], nums[mid], nums[right]
        if (l <= m <= r) or (r <= m <= l):
            return mid  # m находится между l и r
        if (m <= l <= r) or (r <= l <= m):
            return left  # l находится между m и r
        return right

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение методом двух указателей (медиана трех)"""
        # Взять nums[left] в качестве опорного элемента
        med = self.median_three(nums, left, (left + right) // 2, right)
        # Переместить медиану в самый левый конец массива
        nums[left], nums[med] = nums[med], nums[left]
        # Взять nums[left] в качестве опорного элемента
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Искать справа налево первый элемент, меньший опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Искать слева направо первый элемент, больший опорного
            # Поменять элементы местами
            nums[i], nums[j] = nums[j], nums[i]
        # Переместить опорный элемент на границу двух подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка"""
        # Завершить рекурсию, когда длина подмассива равна 1
        if left >= right:
            return
        # Разбиение методом двух указателей
        pivot = self.partition(nums, left, right)
        # Рекурсивно обработать левый и правый подмассивы
        self.quick_sort(nums, left, pivot - 1)
        self.quick_sort(nums, pivot + 1, right)


class QuickSortTailCall:
    """Класс быстрой сортировки (оптимизация глубины рекурсии)"""

    def partition(self, nums: list[int], left: int, right: int) -> int:
        """Разбиение методом двух указателей"""
        # Взять nums[left] в качестве опорного элемента
        i, j = left, right
        while i < j:
            while i < j and nums[j] >= nums[left]:
                j -= 1  # Искать справа налево первый элемент, меньший опорного
            while i < j and nums[i] <= nums[left]:
                i += 1  # Искать слева направо первый элемент, больший опорного
            # Поменять элементы местами
            nums[i], nums[j] = nums[j], nums[i]
        # Переместить опорный элемент на границу двух подмассивов
        nums[i], nums[left] = nums[left], nums[i]
        return i  # Вернуть индекс опорного элемента

    def quick_sort(self, nums: list[int], left: int, right: int):
        """Быстрая сортировка (оптимизация глубины рекурсии)"""
        # Завершить, когда длина подмассива равна 1
        while left < right:
            # Операция разбиения методом двух указателей
            pivot = self.partition(nums, left, right)
            # Выполнить быструю сортировку для более короткого из двух подмассивов
            if pivot - left < right - pivot:
                self.quick_sort(nums, left, pivot - 1)  # Рекурсивно отсортировать левый подмассив
                left = pivot + 1  # Оставшийся неотсортированный диапазон равен [pivot + 1, right]
            else:
                self.quick_sort(nums, pivot + 1, right)  # Рекурсивно отсортировать правый подмассив
                right = pivot - 1  # Оставшийся неотсортированный диапазон равен [left, pivot - 1]


"""Driver Code"""
if __name__ == "__main__":
    # Быстрая сортировка
    nums = [2, 4, 1, 0, 3, 5]
    QuickSort().quick_sort(nums, 0, len(nums) - 1)
    print("Быстрая сортировкапосле завершения nums =", nums)

    # Быстрая сортировка (оптимизация с медианным опорным элементом)
    nums1 = [2, 4, 1, 0, 3, 5]
    QuickSortMedian().quick_sort(nums1, 0, len(nums1) - 1)
    print("Быстрая сортировка (оптимизация с медианным опорным элементом)после завершения nums =", nums1)

    # Быстрая сортировка (оптимизация глубины рекурсии)
    nums2 = [2, 4, 1, 0, 3, 5]
    QuickSortTailCall().quick_sort(nums2, 0, len(nums2) - 1)
    print("Быстрая сортировка (оптимизация глубины рекурсии)после завершения nums =", nums2)
