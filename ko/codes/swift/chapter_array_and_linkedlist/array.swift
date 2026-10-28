/**
 * File: array.swift
 * Created Time: 2023-01-05
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원소에 임의 접근 */
func randomAccess(nums: [Int]) -> Int {
    // 구간 [0, nums.count)에서 숫자 하나를 무작위로 뽑는다
    let randomIndex = nums.indices.randomElement()!
    // 무작위 원소를 가져와 반환한다
    let randomNum = nums[randomIndex]
    return randomNum
}

/* 배열 길이 확장 */
func extend(nums: [Int], enlarge: Int) -> [Int] {
    // 길이를 확장한 배열을 초기화한다
    var res = Array(repeating: 0, count: nums.count + enlarge)
    // 원래 배열의 모든 원소를 새 배열에 복사한다
    for i in nums.indices {
        res[i] = nums[i]
    }
    // 확장한 새 배열을 반환한다
    return res
}

/* 배열의 인덱스 index에 원소 num 삽입 */
func insert(nums: inout [Int], num: Int, index: Int) {
    // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    for i in stride(from: nums.count - 1, to: index, by: -1) {
        nums[i] = nums[i - 1]
    }
    // index 위치의 원소에 num을 대입한다
    nums[index] = num
}

/* 인덱스 index에 있는 원소 삭제 */
func remove(nums: inout [Int], index: Int) {
    // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    for i in nums.indices.dropFirst(index).dropLast() {
        nums[i] = nums[i + 1]
    }
}

/* 배열 순회 */
func traverse(nums: [Int]) {
    var count = 0
    // 인덱스를 통해 배열을 순회한다
    for i in nums.indices {
        count += nums[i]
    }
    // 배열의 원소를 직접 순회한다
    for num in nums {
        count += num
    }
    // 데이터의 인덱스와 원소를 함께 순회한다
    for (i, num) in nums.enumerated() {
        count += nums[i]
        count += num
    }
}

/* 배열에서 지정한 원소 탐색 */
func find(nums: [Int], target: Int) -> Int {
    for i in nums.indices {
        if nums[i] == target {
            return i
        }
    }
    return -1
}

@main
enum _Array {
    /* 실행 코드 */
    static func main() {
        /* 배열 초기화 */
        let arr = Array(repeating: 0, count: 5)
        print("배열 arr = \(arr)")
        var nums = [1, 3, 2, 5, 4]
        print("배열 nums = \(nums)")

        /* 임의 접근 */
        let randomNum = randomAccess(nums: nums)
        print("nums에서 무작위로 가져온 원소 = \(randomNum)")

        /* 길이 확장 */
        nums = extend(nums: nums, enlarge: 3)
        print("배열 길이를 8로 확장한 후 nums = \(nums)")

        /* 원소 삽입 */
        insert(nums: &nums, num: 6, index: 3)
        print("인덱스 3에 숫자 6을 삽입한 후 nums = \(nums)")

        /* 원소 삭제 */
        remove(nums: &nums, index: 2)
        print("인덱스 2의 원소를 삭제한 후 nums = \(nums)")

        /* 배열 순회 */
        traverse(nums: nums)

        /* 원소 탐색 */
        let index = find(nums: nums, target: 3)
        print("nums에서 원소 3을 찾은 인덱스 = \(index)")
    }
}
