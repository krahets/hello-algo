/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 리스트 클래스 */
class MyList {
    private var arr: [Int] // 배열(리스트 원소 저장)
    private var _capacity: Int // 리스트 용량
    private var _size: Int // 리스트 길이(현재 원소 개수)
    private let extendRatio: Int // 리스트의 용량을 확장할 때마다 적용하는 배수

    /* 생성자 */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* 리스트 길이(현재 원소 개수) 반환*/
    func size() -> Int {
        _size
    }

    /* 리스트 용량 반환 */
    func capacity() -> Int {
        _capacity
    }

    /* 원소 접근 */
    func get(index: Int) -> Int {
        // 인덱스가 범위를 벗어나면 오류를 발생시킨다. 아래에서도 동일하다
        if index < 0 || index >= size() {
            fatalError("인덱스가 범위를 벗어났다")
        }
        return arr[index]
    }

    /* 원소 갱신 */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("인덱스가 범위를 벗어났다")
        }
        arr[index] = num
    }

    /* 맨 뒤에 원소 추가 */
    func add(num: Int) {
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // 원소 개수를 갱신한다
        _size += 1
    }

    /* 중간에 원소 삽입 */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("인덱스가 범위를 벗어났다")
        }
        // 원소 개수가 용량을 초과하면 용량 확장을 수행한다
        if size() == capacity() {
            extendCapacity()
        }
        // 인덱스 index와 그 뒤의 원소를 모두 한 칸씩 뒤로 이동한다
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // 원소 개수를 갱신한다
        _size += 1
    }

    /* 원소 삭제 */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("인덱스가 범위를 벗어났다")
        }
        let num = arr[index]
        // 인덱스 index 뒤의 원소를 모두 한 칸씩 앞으로 이동한다
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // 원소 개수를 갱신한다
        _size -= 1
        // 삭제한 원소를 반환한다
        return num
    }

    /* 리스트 용량 확장 */
    func extendCapacity() {
        // 길이가 원래 배열의 extendRatio배인 새 배열을 생성하고, 원래 배열을 새 배열에 복사한다
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // 리스트 용량을 갱신한다
        _capacity = arr.count
    }

    /* 리스트를 배열로 변환 */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* 실행 코드 */
    static func main() {
        /* 리스트 초기화 */
        let nums = MyList()
        /* 맨 뒤에 원소 추가 */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("리스트 nums = \(nums.toArray()), 용량 = \(nums.capacity()), 길이 = \(nums.size())")

        /* 중간에 원소 삽입 */
        nums.insert(index: 3, num: 6)
        print("인덱스 3에 숫자 6을 삽입한 후 nums = \(nums.toArray())")

        /* 원소 삭제 */
        nums.remove(index: 3)
        print("인덱스 3의 원소를 삭제한 후 nums = \(nums.toArray())")

        /* 원소 접근 */
        let num = nums.get(index: 1)
        print("인덱스 1의 원소에 접근한 결과 num = \(num)")

        /* 원소 갱신 */
        nums.set(index: 1, num: 0)
        print("인덱스 1의 원소를 0으로 갱신한 후 nums = \(nums.toArray())")

        /* 용량 확장 동작 테스트 */
        for i in 0 ..< 10 {
            // i = 5일 때 리스트 길이가 용량을 초과하므로 용량 확장이 수행된다
            nums.add(num: i)
        }
        print("용량을 확장한 후 리스트 nums = \(nums.toArray()), 용량 = \(nums.capacity()), 길이 = \(nums.size())")
    }
}
