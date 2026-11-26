/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 雙向鏈結串列的節點 */
class ListNode {
    var val: Int // 節點值
    var next: ListNode? // 指向下一個節點的參照
    weak var prev: ListNode? // 指向上一個節點的弱參照

    init(val: Int) {
        self.val = val
    }
}

/* 以雙向鏈結串列實作雙端佇列 */
class LinkedListDeque {
    private var front: ListNode? // front 指向首節點
    private var rear: ListNode? // rear 指向尾節點
    private var _size: Int // 雙端佇列長度

    init() {
        _size = 0
    }

    /* 取得雙端佇列長度 */
    func size() -> Int {
        _size
    }

    /* 判斷雙端佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 加入元素 */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // 若鏈結串列為空，讓 front 和 rear 都指向 node
        if isEmpty() {
            front = node
            rear = node
        }
        // 從隊首加入元素
        else if isFront {
            // 將 node 加到鏈結串列的開頭
            front?.prev = node
            node.next = front
            front = node // 更新首節點
        }
        // 從隊尾加入元素
        else {
            // 將 node 加到鏈結串列的末端
            rear?.next = node
            node.prev = rear
            rear = node // 更新尾節點
        }
        _size += 1 // 將雙端佇列長度加 1
    }

    /* 從隊首加入元素 */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* 從隊尾加入元素 */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* 取出元素 */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("雙端佇列為空")
        }
        let val: Int
        // 佇列長度為 1 時，首尾兩端指向同一個節點
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // 從隊首取出元素
        else if isFront {
            val = front!.val // 暫存首節點的值
            // 移除首節點
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // 更新首節點
        }
        // 從隊尾取出元素
        else {
            val = rear!.val // 暫存尾節點的值
            // 移除尾節點
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // 更新尾節點
        }
        _size -= 1 // 將雙端佇列長度減 1
        return val
    }

    /* 從隊首取出元素 */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* 從隊尾取出元素 */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* 讀取隊首元素 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("雙端佇列為空")
        }
        return front!.val
    }

    /* 讀取隊尾元素 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("雙端佇列為空")
        }
        return rear!.val
    }

    /* 回傳陣列以便輸出 */
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
    /* 範例程式 */
    static func main() {
        /* 初始化雙端佇列 */
        let deque = LinkedListDeque()
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("雙端佇列 deque = \(deque.toArray())")

        /* 讀取隊首與隊尾元素 */
        let peekFirst = deque.peekFirst()
        print("隊首元素 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("隊尾元素 peekLast = \(peekLast)")

        /* 將元素加入雙端佇列 */
        deque.pushLast(num: 4)
        print("將元素 4 加到隊尾後 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("將元素 1 加到隊首後 deque = \(deque.toArray())")

        /* 從雙端佇列取出元素 */
        let popLast = deque.popLast()
        print("從隊尾取出的元素 = \(popLast)，取出後 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("從隊首取出的元素 = \(popFirst)，取出後 deque = \(deque.toArray())")

        /* 取得雙端佇列長度 */
        let size = deque.size()
        print("雙端佇列長度 size = \(size)")

        /* 判斷雙端佇列是否為空 */
        let isEmpty = deque.isEmpty()
        print("雙端佇列是否為空 = \(isEmpty)")
    }
}
