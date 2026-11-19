// File: list_test.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

import (
	"fmt"
	"sort"
	"testing"
)

/* 실행 코드 */
func TestList(t *testing.T) {
	// [region]{init_list}
	/* 리스트 초기화 */
	// 초깃값 없음
	emptyNums := []int{}
	// 초깃값 있음
	nums := []int{1, 3, 2, 5, 4}
	// [endregion]{init_list}
	fmt.Println("리스트 nums =", nums)
	fmt.Println("리스트 emptyNums =", emptyNums)

	// [region]{access_element}
	/* 원소 접근 */
	num := nums[1] // 인덱스 1의 원소에 접근한다
	// [endregion]{access_element}
	fmt.Println("인덱스 1의 원소에 접근하여 얻은 num =", num)

	// [region]{update_element}
	/* 원소 갱신 */
	nums[1] = 0 // 인덱스 1의 원소를 0으로 갱신한다
	// [endregion]{update_element}
	fmt.Println("인덱스 1의 원소를 0으로 갱신한 후 nums =", nums)

	// [region]{clear_list}
	/* 리스트 비우기 */
	nums = nil
	// [endregion]{clear_list}
	fmt.Println("리스트를 비운 후 nums =", nums)

	// [region]{append_element}
	/* 맨 뒤에 원소 추가 */
	nums = append(nums, 1)
	nums = append(nums, 3)
	nums = append(nums, 2)
	nums = append(nums, 5)
	nums = append(nums, 4)
	// [endregion]{append_element}
	fmt.Println("원소를 추가한 후 nums =", nums)

	// [region]{insert_element}
	/* 중간에 원소 삽입 */
	nums = append(nums[:3], append([]int{6}, nums[3:]...)...) // 인덱스 3에 숫자 6을 삽입한다
	// [endregion]{insert_element}
	fmt.Println("인덱스 3에 숫자 6을 삽입한 후 nums =", nums)

	// [region]{remove_element}
	/* 원소 삭제 */
	nums = append(nums[:3], nums[4:]...) // 인덱스 3의 원소를 삭제한다
	// [endregion]{remove_element}
	fmt.Println("인덱스 3의 원소를 삭제한 후 nums =", nums)

	// [region]{iterate_list}
	/* 인덱스를 통해 리스트를 순회한다 */
	count := 0
	for i := 0; i < len(nums); i++ {
		count += nums[i]
	}

	/* 리스트의 원소를 직접 순회한다 */
	count = 0
	for _, x := range nums {
		count += x
	}
	// [endregion]{iterate_list}

	// [region]{concat_list}
	/* 두 리스트 연결 */
	nums1 := []int{6, 8, 7, 10, 9}
	nums = append(nums, nums1...) // 리스트 nums1을 nums 뒤에 연결한다
	// [endregion]{concat_list}
	fmt.Println("리스트 nums1을 nums 뒤에 연결한 후 nums =", nums)

	// [region]{sort_list}
	/* 리스트 정렬 */
	sort.Ints(nums) // 정렬 후 리스트 원소는 작은 값부터 큰 값 순서로 나열된다
	// [endregion]{sort_list}
	fmt.Println("리스트를 정렬한 후 nums =", nums)
}
