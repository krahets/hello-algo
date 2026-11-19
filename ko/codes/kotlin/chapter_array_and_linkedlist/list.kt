/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 실행 코드 */
fun main() {
    // [region]{init_list}
    /* 리스트 초기화 */
    // 초깃값 없음
    val emptyNums = mutableListOf<Int>()
    // 초깃값 있음
    val nums = mutableListOf(1, 3, 2, 5, 4)
    // [endregion]{init_list}
    println("리스트 nums = $nums")
    println("리스트 emptyNums = $emptyNums")

    // [region]{access_element}
    /* 원소 접근 */
    val num = nums[1] // 인덱스 1의 원소에 접근한다
    // [endregion]{access_element}
    println("인덱스 1의 원소에 접근한 결과 num = $num")

    // [region]{update_element}
    /* 원소 갱신 */
    nums[1] = 0 // 인덱스 1의 원소를 0으로 갱신한다
    // [endregion]{update_element}
    println("인덱스 1의 원소를 0으로 갱신한 후 nums = $nums")

    // [region]{clear_list}
    /* 리스트 비우기 */
    nums.clear()
    // [endregion]{clear_list}
    println("리스트를 비운 후 nums = $nums")

    // [region]{append_element}
    /* 맨 뒤에 원소 추가 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    // [endregion]{append_element}
    println("원소를 추가한 후 nums = $nums")

    // [region]{insert_element}
    /* 중간에 원소 삽입 */
    nums.add(3, 6) // 인덱스 3에 숫자 6을 삽입한다
    // [endregion]{insert_element}
    println("인덱스 3에 숫자 6을 삽입한 후 nums = $nums")

    // [region]{remove_element}
    /* 원소 삭제 */
    nums.removeAt(3) // 인덱스 3의 원소를 삭제한다
    // [endregion]{remove_element}
    println("인덱스 3의 원소를 삭제한 후 nums = $nums")

    // [region]{iterate_list}
    /* 인덱스를 통해 리스트를 순회한다 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 리스트의 원소를 직접 순회한다 */
    for (j in nums) {
        count += j
    }
    // [endregion]{iterate_list}

    // [region]{concat_list}
    /* 두 리스트 연결 */
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1) // 리스트 nums1을 nums 뒤에 연결한다
    // [endregion]{concat_list}
    println("리스트 nums 뒤에 nums1을 연결한 후 nums = $nums")

    // [region]{sort_list}
    /* 리스트 정렬 */
    nums.sort() // 정렬 후 리스트 원소는 작은 값부터 큰 값 순서로 나열된다
    // [endregion]{sort_list}
    println("리스트를 정렬한 후 nums = $nums")
}