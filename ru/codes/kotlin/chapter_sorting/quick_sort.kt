/**
 * File: quick_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Обмен элементов */
fun swap(nums: IntArray, i: Int, j: Int) {
    val temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

/* Разбиение с опорными указателями */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // Взять nums[left] в качестве опорного элемента
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // Идти справа налево в поисках первого элемента меньше опорного
        while (i < j && nums[i] <= nums[left])
            i++           // Идти слева направо в поисках первого элемента больше опорного
        swap(nums, i, j)  // Поменять эти два элемента местами
    }
    swap(nums, i, left)   // Переместить опорный элемент на границу двух подмассивов
    return i              // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if (left >= right) return
    // Разбиение с опорными указателями
    val pivot = partition(nums, left, right)
    // Рекурсивно обработать левый и правый подмассивы
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Выбрать медиану из трех кандидатов */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m находится между l и r
    if ((l in m..r) || (l in r..m))
        return left // l находится между m и r
    return right
}

/* Разбиение с опорными указателями (медиана трех) */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // Выбрать медиану из трех кандидатов
    val med = medianThree(nums, left, (left + right) / 2, right)
    // Переместить медиану в крайний левый элемент массива
    swap(nums, left, med)
    // Взять nums[left] в качестве опорного элемента
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // Идти справа налево в поисках первого элемента меньше опорного
        while (i < j && nums[i] <= nums[left])
            i++                      // Идти слева направо в поисках первого элемента больше опорного
        swap(nums, i, j)             // Поменять эти два элемента местами
    }
    swap(nums, i, left)              // Переместить опорный элемент на границу двух подмассивов
    return i                         // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if (left >= right) return
    // Разбиение с опорными указателями
    val pivot = partitionMedian(nums, left, right)
    // Рекурсивно обработать левый и правый подмассивы
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Быстрая сортировка (оптимизация глубины рекурсии) */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // Завершить, когда длина подмассива равна 1
    var l = left
    var r = right
    while (l < r) {
        // Операция разбиения с опорными указателями
        val pivot = partition(nums, l, r)
        // Выполнить быструю сортировку для более короткого из двух подмассивов
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // Рекурсивно отсортировать левый подмассив
            l = pivot + 1 // Оставшийся неотсортированный диапазон: [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // Рекурсивно отсортировать правый подмассив
            r = pivot - 1 // Оставшийся неотсортированный диапазон: [left, pivot - 1]
        }
    }
}

/* Driver Code */
fun main() {
    /* Быстрая сортировка */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("После быстрой сортировки nums = ${nums.contentToString()}")

    /* Быстрая сортировка (оптимизация медианным опорным элементом) */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("После быстрой сортировки (оптимизация медианным опорным элементом) nums1 = ${nums1.contentToString()}")

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("После быстрой сортировки (оптимизация глубины рекурсии) nums2 = ${nums2.contentToString()}")
}