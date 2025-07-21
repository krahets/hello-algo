/**
 * File: my_list.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_array_and_linkedlist

/* 列表类 */
class MyList {
    private var arr: Array<Int64> // 数组（存储列表元素）
    private var _capacity = 10 // 列表容量
    private var _size = 0 // 列表长度（当前元素数量）
    private var extendRatio = 2 // 每次列表扩容的倍数

    /* 构造方法 */
    public init() {
        arr = Array<Int64>(_capacity, repeat: 0)
    }

    /* 获取列表长度（当前元素数量） */
    public prop size: Int64 {
        get() {
            _size
        }
    }

    /* 获取列表容量 */
    public prop capacity: Int64 {
        get() {
            _capacity
        }
    }

    /* 访问元素 */
    public func get(index: Int64): ?Int64 {
        // 索引如果越界，则抛出异常，下同
        if (index < 0 || index >= size) {
            // throw IndexOutOfBoundsException("索引越界")
            return None
        }
        return arr[index]
    }

    /* 更新元素 */
    public func set(index: Int64, num: Int64): Unit {
        if (index < 0 || index >= size) {
            throw IndexOutOfBoundsException("索引越界")
        }
        arr[index] = num
    }

    /* 在尾部添加元素 */
    public func add(num: Int64): Unit {
        // 元素数量超出容量时，触发扩容机制
        if (_size == capacity) {
            extendCapacity()
        }
        arr[size] = num
        // 更新元素数量
        _size++
    }

    /* 在中间插入元素 */
    public func insert(index: Int64, num: Int64): Unit {
        if (index < 0 || index >= _size) {
            throw IndexOutOfBoundsException("索引越界")
        }
        // 元素数量超出容量时，触发扩容机制
        if (size == _capacity) {
            extendCapacity()
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for (i in (size - 1)..=index : -1) {
            arr[i + 1] = arr[i]
        }
        arr[index] = num
        // 更新元素数量
        _size++
    }

    /* 删除元素 */
    public func remove(index: Int64): Int64 {
        if (index < 0 || index >= size) {
            throw IndexOutOfBoundsException("索引越界")
        }
        let num = arr[index]
        // 将将索引 index 之后的元素都向前移动一位
        for (i in index..(size - 1)) {
            arr[i] = arr[i + 1]
        }
        // 更新元素数量
        _size--
        // 返回被删除的元素
        return num
    }

    /* 列表扩容 */
    public func extendCapacity(): Unit {
        // 新建一个长度为原数组 extendRatio 倍的新数组，并将原数组复制到新数组
        let ext_capacity = capacity * extendRatio
        var dst = Array<Int64>(ext_capacity, repeat: 0)
        arr.copyTo(dst, 0, 0, arr.size)
        arr = dst
        // 更新列表容量
        _capacity = ext_capacity
    }

    /* 将列表转换为数组 */
    public func toArray(): Array<Int64> {
        // 仅转换有效长度范围内的列表元素
        let arr = Array<Int64>(size, repeat: 0)
        for (i in 0..size) {
            arr[i] = get(i).getOrThrow()
        }
        return arr
    }
}
