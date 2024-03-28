/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 雙向鏈結串列節點 */
class ListNode {
    var val: Int // 節點值
    var next: ListNode? // 後繼節點引用
    weak var prev: ListNode? // 前驅節點引用

    init(val: Int) {
        self.val = val
    }
}

/* 基於雙向鏈結串列實現的雙向佇列 */
class LinkedListDeque {
    private var front: ListNode? // 頭節點 front
    private var rear: ListNode? // 尾節點 rear
    private var _size: Int // 雙向佇列的長度

    init() {
        _size = 0
    }

    /* 獲取雙向佇列的長度 */
    func size() -> Int {
        _size
    }

    /* 判斷雙向佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入列操作 */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // 若鏈結串列為空，則令 front 和 rear 都指向 node
        if isEmpty() {
            front = node
            rear = node
        }
        // 佇列首入列操作
        else if isFront {
            // 將 node 新增至鏈結串列頭部
            front?.prev = node
            node.next = front
            front = node // 更新頭節點
        }
        // 佇列尾入列操作
        else {
            // 將 node 新增至鏈結串列尾部
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾節點
        }
        _size += 1 // 更新佇列長度
    }

    /* 佇列首入列 */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* 佇列尾入列 */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* 出列操作 */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("雙向佇列為空")
        }
        let val: Int
        // 佇列首出列操作
        if isFront {
            val = front!.val // 暫存頭節點值
            // 刪除頭節點
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                front?.next = nil
            }
            front = fNext // 更新頭節點
        }
        // 佇列尾出列操作
        else {
            val = rear!.val // 暫存尾節點值
            // 刪除尾節點
            let rPrev = rear?.prev
            if rPrev != nil {
                rPrev?.next = nil
                rear?.prev = nil
            }
            rear = rPrev // 更新尾節點
        }
        _size -= 1 // 更新佇列長度
        return val
    }

    /* 佇列首出列 */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* 佇列尾出列 */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* 訪問佇列首元素 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("雙向佇列為空")
        }
        return front!.val
    }

    /* 訪問佇列尾元素 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("雙向佇列為空")
        }
        return rear!.val
    }

    /* 返回陣列用於列印 */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListDeque {
    /* Driver Code */
    static func main() {
        /* 初始化雙向佇列 */
        let deque = LinkedListDeque()
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("雙向佇列 deque = \(deque.toArray())")

        /* 訪問元素 */
        let peekFirst = deque.peekFirst()
        print("佇列首元素 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("佇列尾元素 peekLast = \(peekLast)")

        /* 元素入列 */
        deque.pushLast(num: 4)
        print("元素 4 佇列尾入列後 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("元素 1 佇列首入列後 deque = \(deque.toArray())")

        /* 元素出列 */
        let popLast = deque.popLast()
        print("佇列尾出列元素 = \(popLast)，佇列尾出列後 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("佇列首出列元素 = \(popFirst)，佇列首出列後 deque = \(deque.toArray())")

        /* 獲取雙向佇列的長度 */
        let size = deque.size()
        print("雙向佇列長度 size = \(size)")

        /* 判斷雙向佇列是否為空 */
        let isEmpty = deque.isEmpty()
        print("雙向佇列是否為空 = \(isEmpty)")
    }
}
