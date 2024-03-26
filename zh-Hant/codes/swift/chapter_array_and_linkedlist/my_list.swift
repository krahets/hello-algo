/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 串列類別 */
class MyList {
    private var arr: [Int] // 陣列（儲存串列元素）
    private var _capacity: Int // 串列容量
    private var _size: Int // 串列長度（當前元素數量）
    private let extendRatio: Int // 每次串列擴容的倍數

    /* 建構子 */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* 獲取串列長度（當前元素數量）*/
    func size() -> Int {
        _size
    }

    /* 獲取串列容量 */
    func capacity() -> Int {
        _capacity
    }

    /* 訪問元素 */
    func get(index: Int) -> Int {
        // 索引如果越界則丟擲錯誤，下同
        if index < 0 || index >= size() {
            fatalError("索引越界")
        }
        return arr[index]
    }

    /* 更新元素 */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("索引越界")
        }
        arr[index] = num
    }

    /* 在尾部新增元素 */
    func add(num: Int) {
        // 元素數量超出容量時，觸發擴容機制
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // 更新元素數量
        _size += 1
    }

    /* 在中間插入元素 */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("索引越界")
        }
        // 元素數量超出容量時，觸發擴容機制
        if size() == capacity() {
            extendCapacity()
        }
        // 將索引 index 以及之後的元素都向後移動一位
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // 更新元素數量
        _size += 1
    }

    /* 刪除元素 */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("索引越界")
        }
        let num = arr[index]
        // 將將索引 index 之後的元素都向前移動一位
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // 更新元素數量
        _size -= 1
        // 返回被刪除的元素
        return num
    }

    /* 串列擴容 */
    func extendCapacity() {
        // 新建一個長度為原陣列 extendRatio 倍的新陣列，並將原陣列複製到新陣列
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // 更新串列容量
        _capacity = arr.count
    }

    /* 將串列轉換為陣列 */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Driver Code */
    static func main() {
        /* 初始化串列 */
        let nums = MyList()
        /* 在尾部新增元素 */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("串列 nums = \(nums.toArray()) ，容量 = \(nums.capacity()) ，長度 = \(nums.size())")

        /* 在中間插入元素 */
        nums.insert(index: 3, num: 6)
        print("在索引 3 處插入數字 6 ，得到 nums = \(nums.toArray())")

        /* 刪除元素 */
        nums.remove(index: 3)
        print("刪除索引 3 處的元素，得到 nums = \(nums.toArray())")

        /* 訪問元素 */
        let num = nums.get(index: 1)
        print("訪問索引 1 處的元素，得到 num = \(num)")

        /* 更新元素 */
        nums.set(index: 1, num: 0)
        print("將索引 1 處的元素更新為 0 ，得到 nums = \(nums.toArray())")

        /* 測試擴容機制 */
        for i in 0 ..< 10 {
            // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
            nums.add(num: i)
        }
        print("擴容後的串列 nums = \(nums.toArray()) ，容量 = \(nums.capacity()) ，長度 = \(nums.size())")
    }
}
