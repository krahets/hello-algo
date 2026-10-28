/**
 * File: list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum List {
    /* 실행 코드 */
    static func main() {
        /* 리스트 초기화 */
        var nums = [1, 3, 2, 5, 4]
        print("리스트 nums = \(nums)")

        /* 원소 접근 */
        let num = nums[1]
        print("인덱스 1의 원소에 접근한 결과 num = \(num)")

        /* 원소 갱신 */
        nums[1] = 0
        print("인덱스 1의 원소를 0으로 갱신한 후 nums = \(nums)")

        /* 리스트 비우기 */
        nums.removeAll()
        print("리스트를 비운 후 nums = \(nums)")

        /* 맨 뒤에 원소 추가 */
        nums.append(1)
        nums.append(3)
        nums.append(2)
        nums.append(5)
        nums.append(4)
        print("원소를 추가한 후 nums = \(nums)")

        /* 중간에 원소 삽입 */
        nums.insert(6, at: 3)
        print("인덱스 3에 숫자 6을 삽입한 후 nums = \(nums)")

        /* 원소 삭제 */
        nums.remove(at: 3)
        print("인덱스 3의 원소를 삭제한 후 nums = \(nums)")

        /* 인덱스를 통해 리스트를 순회한다 */
        var count = 0
        for i in nums.indices {
            count += nums[i]
        }
        /* 리스트의 원소를 직접 순회한다 */
        count = 0
        for x in nums {
            count += x
        }

        /* 두 리스트 연결 */
        let nums1 = [6, 8, 7, 10, 9]
        nums.append(contentsOf: nums1)
        print("리스트 nums 뒤에 nums1을 연결한 후 nums = \(nums)")

        /* 리스트 정렬 */
        nums.sort()
        print("리스트를 정렬한 후 nums = \(nums)")
    }
}
