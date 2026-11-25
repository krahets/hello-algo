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

/* Разбиение двумя указателями */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // Выбрать nums[left] опорным элементом
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // Справа налево найти первый элемент меньше опорного
        while (i < j && nums[i] <= nums[left])
            i++           // Слева направо найти первый элемент больше опорного
        swap(nums, i, j)  // Поменять эти элементы местами
    }
    swap(nums, i, left)   // Обменом поместить опорный элемент на границу подмассивов
    return i              // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // Завершить рекурсию при длине подмассива 1
    if (left >= right) return
    // Разбиение двумя указателями
    val pivot = partition(nums, left, right)
    // Рекурсивно отсортировать левый и правый подмассивы
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Выбрать медиану трёх кандидатов */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m лежит между l и r
    if ((l in m..r) || (l in r..m))
        return left // l лежит между m и r
    return right
}

/* Разбиение двумя указателями с выбором медианы трёх */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // Выбрать медиану трёх кандидатов
    val med = medianThree(nums, left, (left + right) / 2, right)
    // Обменом поместить медиану в начало массива
    swap(nums, left, med)
    // Выбрать nums[left] опорным элементом
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // Справа налево найти первый элемент меньше опорного
        while (i < j && nums[i] <= nums[left])
            i++                      // Слева направо найти первый элемент больше опорного
        swap(nums, i, j)             // Поменять эти элементы местами
    }
    swap(nums, i, left)              // Обменом поместить опорный элемент на границу подмассивов
    return i                         // Вернуть индекс опорного элемента
}

/* Быстрая сортировка */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // Завершить рекурсию при длине подмассива 1
    if (left >= right) return
    // Разбиение двумя указателями
    val pivot = partitionMedian(nums, left, right)
    // Рекурсивно отсортировать левый и правый подмассивы
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Быстрая сортировка с уменьшенной глубиной рекурсии */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // Завершить обработку при длине подмассива 1
    var l = left
    var r = right
    while (l < r) {
        // Выполнить разбиение двумя указателями
        val pivot = partition(nums, l, r)
        // Применить быструю сортировку к более короткому подмассиву
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // Рекурсивно отсортировать левый подмассив
            l = pivot + 1 // Оставшийся неотсортированный участок: [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // Рекурсивно отсортировать правый подмассив
            r = pivot - 1 // Оставшийся неотсортированный участок: [left, pivot - 1]
        }
    }
}

/* Тестовый пример */
fun main() {
    /* Быстрая сортировка */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("После быстрой сортировки nums = ${nums.contentToString()}")

    /* Быстрая сортировка с выбором медианы в качестве опорного элемента */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("После быстрой сортировки с выбором медианы nums1 = ${nums1.contentToString()}")

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("После быстрой сортировки с уменьшенной глубиной рекурсии nums2 = ${nums2.contentToString()}")
}