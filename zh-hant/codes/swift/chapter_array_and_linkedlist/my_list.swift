/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 列表類別 */
class MyList {
    private var arr: [Int] // 陣列（用來儲存列表元素）
    private var _capacity: Int // 列表容量
    private var _size: Int // 列表長度（目前的元素數量）
    private let extendRatio: Int // 每次擴充列表容量的倍數

    /* 建構方法 */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* 取得列表長度（目前的元素數量）*/
    func size() -> Int {
        _size
    }

    /* 取得列表容量 */
    func capacity() -> Int {
        _capacity
    }

    /* 存取元素 */
    func get(index: Int) -> Int {
        // 若索引超出範圍，就拋出錯誤，以下同理
        if index < 0 || index >= size() {
            fatalError("索引超出範圍")
        }
        return arr[index]
    }

    /* 更新元素 */
    func set(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("索引超出範圍")
        }
        arr[index] = num
    }

    /* 在尾端加入元素 */
    func add(num: Int) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
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
            fatalError("索引超出範圍")
        }
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if size() == capacity() {
            extendCapacity()
        }
        // 將索引 index 起的所有元素往後移一格
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
            fatalError("索引超出範圍")
        }
        let num = arr[index]
        // 將索引 index 之後的所有元素往前移一格
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // 更新元素數量
        _size -= 1
        // 回傳刪除的元素
        return num
    }

    /* 擴充列表容量 */
    func extendCapacity() {
        // 建立長度為原陣列 extendRatio 倍的新陣列，並將原陣列的內容複製過去
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // 更新列表容量
        _capacity = arr.count
    }

    /* 將列表轉為陣列 */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* 範例主程式 */
    static func main() {
        /* 初始化列表 */
        let nums = MyList()
        /* 在尾端加入元素 */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("列表 nums = \(nums.toArray())，容量 = \(nums.capacity())，長度 = \(nums.size())")

        /* 在中間插入元素 */
        nums.insert(index: 3, num: 6)
        print("在索引 3 處插入數字 6，得到 nums = \(nums.toArray())")

        /* 刪除元素 */
        nums.remove(index: 3)
        print("刪除索引 3 處的元素，得到 nums = \(nums.toArray())")

        /* 存取元素 */
        let num = nums.get(index: 1)
        print("存取索引 1 處的元素，得到 num = \(num)")

        /* 更新元素 */
        nums.set(index: 1, num: 0)
        print("將索引 1 處的元素更新為 0，得到 nums = \(nums.toArray())")

        /* 測試容量擴充機制 */
        for i in 0 ..< 10 {
            // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
            nums.add(num: i)
        }
        print("擴充後的列表 nums = \(nums.toArray())，容量 = \(nums.capacity())，長度 = \(nums.size())")
    }
}
