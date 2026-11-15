/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* Driver Code */
fun main() {
    /* Инициализация списка */
    // Изменяемое множество
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("Список nums = $nums")

    // [region]{access_element}
    /* Доступ к элементу */
    val num = nums[1] // Доступ к элементу по индексу 1
    // [endregion]{access_element}
    println("Элемент по индексу 1: num = $num")

    // [region]{update_element}
    /* Изменение элемента */
    nums[1] = 0 // Изменить значение элемента с индексом 1 на 0
    // [endregion]{update_element}
    println("После изменения значения элемента с индексом 1 на 0 nums = $nums")

    // [region]{clear_list}
    /* Очистить список */
    nums.clear()
    // [endregion]{clear_list}
    println("После очистки списка nums = $nums")

    // [region]{append_element}
    /* Добавление элемента в конец */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    // [endregion]{append_element}
    println("После добавления элементов nums = $nums")

    // [region]{insert_element}
    /* Вставка элемента в середину */
    nums.add(3, 6) // Вставить число 6 по индексу 3
    // [endregion]{insert_element}
    println("После вставки числа 6 по индексу 3 nums = $nums")

    // [region]{remove_element}
    /* Удаление элемента */
    nums.removeAt(3) // Удалить элемент по индексу 3
    // [endregion]{remove_element}
    println("После удаления элемента по индексу 3 nums = $nums")

    // [region]{iterate_list}
    /* Обходить список по индексам */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* Непосредственно обходить элементы списка */
    for (j in nums) {
        count += j
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* Объединить два списка */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // Присоединить список nums1 к концу nums
    // [endregion]{concat_list}
    println("После конкатенации списка nums1 к nums nums = $nums")

    // [region]{sort_list}
    /* Отсортировать список */
    nums.sort() // После сортировки элементы списка идут по возрастанию
    // [endregion]{sort_list}
    println("После сортировки списка nums = $nums")
}