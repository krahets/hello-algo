/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 列表类 */
class MyList {
    private var arr: [Int] // 数组（存储列表元素）
    private var _capacity: Int // 列表容量
    private var _size: Int // 列表长度（当前元素数量）
    private let extendRatio: Int // 每次列表扩容的倍数

    /* 构造方法 */
    init() {
        _capacity = 10
        _size = 0
        extendRatio = 2
        arr = Array(repeating: 0, count: _capacity)
    }

    /* 获取列表长度（当前元素数量）*/
    func size() -> Int {
        _size
    }

    /* 获取列表容量 */
    func capacity() -> Int {
        _capacity
    }

    /* 访问元素 */
    func get(index: Int) -> Int {
        // 索引如果越界则抛出错误，下同
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

    /* 在尾部添加元素 */
    func add(num: Int) {
        // 元素数量超出容量时，触发扩容机制
        if size() == capacity() {
            extendCapacity()
        }
        arr[size()] = num
        // 更新元素数量
        _size += 1
    }

    /* 在中间插入元素 */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= size() {
            fatalError("索引越界")
        }
        // 元素数量超出容量时，触发扩容机制
        if size() == capacity() {
            extendCapacity()
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for j in (index ..< size()).reversed() {
            arr[j + 1] = arr[j]
        }
        arr[index] = num
        // 更新元素数量
        _size += 1
    }

    /* 删除元素 */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= size() {
            fatalError("索引越界")
        }
        let num = arr[index]
        // 将将索引 index 之后的元素都向前移动一位
        for j in index ..< (size() - 1) {
            arr[j] = arr[j + 1]
        }
        // 更新元素数量
        _size -= 1
        // 返回被删除的元素
        return num
    }

    /* 列表扩容 */
    func extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
        arr = arr + Array(repeating: 0, count: capacity() * (extendRatio - 1))
        // 更新列表容量
        _capacity = arr.count
    }

    /* 将列表转换为数组 */
    func toArray() -> [Int] {
        Array(arr.prefix(size()))
    }
}

@main
enum _MyList {
    /* Driver Code */
    static func main() {
        /* 初始化列表 */
        let nums = MyList()
        /* 在尾部添加元素 */
        nums.add(num: 1)
        nums.add(num: 3)
        nums.add(num: 2)
        nums.add(num: 5)
        nums.add(num: 4)
        print("列表 nums = \(nums.toArray()) ，容量 = \(nums.capacity()) ，长度 = \(nums.size())")

        /* 在中间插入元素 */
        nums.insert(index: 3, num: 6)
        print("在索引 3 处插入数字 6 ，得到 nums = \(nums.toArray())")

        /* 删除元素 */
        nums.remove(index: 3)
        print("删除索引 3 处的元素，得到 nums = \(nums.toArray())")

        /* 访问元素 */
        let num = nums.get(index: 1)
        print("访问索引 1 处的元素，得到 num = \(num)")

        /* 更新元素 */
        nums.set(index: 1, num: 0)
        print("将索引 1 处的元素更新为 0 ，得到 nums = \(nums.toArray())")

        /* 测试扩容机制 */
        for i in 0 ..< 10 {
            // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
            nums.add(num: i)
        }
        print("扩容后的列表 nums = \(nums.toArray()) ，容量 = \(nums.capacity()) ，长度 = \(nums.size())")
    }
}
