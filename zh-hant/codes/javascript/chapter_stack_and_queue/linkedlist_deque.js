/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 雙向鏈結串列節點 */
class ListNode {
    prev; // 前驅節點引用 (指標)
    next; // 後繼節點引用 (指標)
    val; // 節點值

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* 基於雙向鏈結串列實現的雙向佇列 */
class LinkedListDeque {
    #front; // 頭節點 front
    #rear; // 尾節點 rear
    #queSize; // 雙向佇列的長度

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* 佇列尾入列操作 */
    pushLast(val) {
        const node = new ListNode(val);
        // 若鏈結串列為空，則令 front 和 rear 都指向 node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // 將 node 新增至鏈結串列尾部
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // 更新尾節點
        }
        this.#queSize++;
    }

    /* 佇列首入列操作 */
    pushFirst(val) {
        const node = new ListNode(val);
        // 若鏈結串列為空，則令 front 和 rear 都指向 node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // 將 node 新增至鏈結串列頭部
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // 更新頭節點
        }
        this.#queSize++;
    }

    /* 佇列尾出列操作 */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // 儲存尾節點值
        // 刪除尾節點
        let temp = this.#rear.prev;
        if (temp !== null) {
            temp.next = null;
            this.#rear.prev = null;
        }
        this.#rear = temp; // 更新尾節點
        this.#queSize--;
        return value;
    }

    /* 佇列首出列操作 */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // 儲存尾節點值
        // 刪除頭節點
        let temp = this.#front.next;
        if (temp !== null) {
            temp.prev = null;
            this.#front.next = null;
        }
        this.#front = temp; // 更新頭節點
        this.#queSize--;
        return value;
    }

    /* 訪問佇列尾元素 */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* 訪問佇列首元素 */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* 獲取雙向佇列的長度 */
    size() {
        return this.#queSize;
    }

    /* 判斷雙向佇列是否為空 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 列印雙向佇列 */
    print() {
        const arr = [];
        let temp = this.#front;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log('[' + arr.join(', ') + ']');
    }
}

/* Driver Code */
/* 初始化雙向佇列 */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('雙向佇列 linkedListDeque = ');
linkedListDeque.print();

/* 訪問元素 */
const peekFirst = linkedListDeque.peekFirst();
console.log('佇列首元素 peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('佇列尾元素 peekLast = ' + peekLast);

/* 元素入列 */
linkedListDeque.pushLast(4);
console.log('元素 4 佇列尾入列後 linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('元素 1 佇列首入列後 linkedListDeque = ');
linkedListDeque.print();

/* 元素出列 */
const popLast = linkedListDeque.popLast();
console.log('佇列尾出列元素 = ' + popLast + '，佇列尾出列後 linkedListDeque = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('佇列首出列元素 = ' + popFirst + '，佇列首出列後 linkedListDeque = ');
linkedListDeque.print();

/* 獲取雙向佇列的長度 */
const size = linkedListDeque.size();
console.log('雙向佇列長度 size = ' + size);

/* 判斷雙向佇列是否為空 */
const isEmpty = linkedListDeque.isEmpty();
console.log('雙向佇列是否為空 = ' + isEmpty);
