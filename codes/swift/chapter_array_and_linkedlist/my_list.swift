/**
 * File: my_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 列表类简易实现 */
class MyList {
    private var nums: [Int] // 数组（存储列表元素）
    private var _capacity = 10 // 列表容量
    private var _size = 0 // 列表长度（即当前元素数量）
    private let extendRatio = 2 // 每次列表扩容的倍数

    /* 构造方法 */
    init() {
        nums = Array(repeating: 0, count: _capacity)
    }

    /* 获取列表长度（即当前元素数量）*/
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
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        return nums[index]
    }

    /* 更新元素 */
    func set(index: Int, num: Int) {
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        nums[index] = num
    }

    /* 尾部添加元素 */
    func add(num: Int) {
        // 元素数量超出容量时，触发扩容机制
        if _size == _capacity {
            extendCapacity()
        }
        nums[_size] = num
        // 更新元素数量
        _size += 1
    }

    /* 中间插入元素 */
    func insert(index: Int, num: Int) {
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        // 元素数量超出容量时，触发扩容机制
        if _size == _capacity {
            extendCapacity()
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for j in sequence(first: _size - 1, next: { $0 >= index + 1 ? $0 - 1 : nil }) {
            nums[j + 1] = nums[j]
        }
        nums[index] = num
        // 更新元素数量
        _size += 1
    }

    /* 删除元素 */
    @discardableResult
    func remove(index: Int) -> Int {
        if index < 0 || index >= _size {
            fatalError("索引越界")
        }
        let num = nums[index]
        // 将索引 index 之后的元素都向前移动一位
        for j in index ..< (_size - 1) {
            nums[j] = nums[j + 1]
        }
        // 更新元素数量
        _size -= 1
        // 返回被删除元素
        return num
    }

    /* 列表扩容 */
    func extendCapacity() {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组拷贝到新数组
        nums = nums + Array(repeating: 0, count: _capacity * (extendRatio - 1))
        // 更新列表容量
        _capacity = nums.count
    }

    /* 将列表转换为数组 */
    func toArray() -> [Int] {
        var nums = Array(repeating: 0, count: _size)
        for i in 0 ..< _size {
            nums[i] = get(index: i)
        }
        return nums
    }
}

@main
enum _MyList {
    /* Driver Code */
    static func main() {
        /* 初始化列表 */
        let list = MyList()
        /* 尾部添加元素 */
        list.add(num: 1)
        list.add(num: 3)
        list.add(num: 2)
        list.add(num: 5)
        list.add(num: 4)
        print("列表 list = \(list.toArray()) ，容量 = \(list.capacity()) ，长度 = \(list.size())")

        /* 中间插入元素 */
        list.insert(index: 3, num: 6)
        print("在索引 3 处插入数字 6 ，得到 list = \(list.toArray())")

        /* 删除元素 */
        list.remove(index: 3)
        print("删除索引 3 处的元素，得到 list = \(list.toArray())")

        /* 访问元素 */
        let num = list.get(index: 1)
        print("访问索引 1 处的元素，得到 num = \(num)")

        /* 更新元素 */
        list.set(index: 1, num: 0)
        print("将索引 1 处的元素更新为 0 ，得到 list = \(list.toArray())")

        /* 测试扩容机制 */
        for i in 0 ..< 10 {
            // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
            list.add(num: i)
        }
        print("扩容后的列表 list = \(list.toArray()) ，容量 = \(list.capacity()) ，长度 = \(list.size())")
    }
}
