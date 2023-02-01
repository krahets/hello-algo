/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 基于数组方法实现的双端队列 */
class Deque {
    array: number[];
    len: number;
    constructor() {
        this.len = 0;
        this.array = [];
    }

    /* 在队尾添加元素 */
    pushBack(value: number): void {
        this.array.push(value);
        this.len++;
    }

    /* 在队首添加元素, 时间复杂度: O(n) */
    pushFront(value: number): void {
        this.array.unshift(value);
        this.len++;
    }

    /* 删除队尾元素 */
    popBack(): number | undefined {
        this.len--;
        return this.array.pop();
    }

    /* 删除队首元素, 时间复杂度: O(n) */
    popFront(): number | undefined {
        this.len--;
        return this.array.shift();
    }

    /* 访问队尾元素 */
    peekLast(): number {
        return this.array[this.len - 1];
    }

    /* 访问队首元素 */
    peekFirst(): number {
        return this.array[0];
    }

    /* 判断队列是否为空 */
    isEmpty(): boolean {
        return this.len === 0;
    }

    /* 获取队列的长度 */
    size(): number {
        return this.len;
    }

    /* 打印队列 */
    printDeque(): void {
        const dequeStr: string = this.array.join(', ')
        console.log(dequeStr);
    };

}

/* 初始化双向队列 */
const deque: Deque = new Deque();

/* 元素入队 */
deque.pushBack(2);
deque.pushBack(5);
deque.pushBack(4);
deque.pushFront(3);
deque.pushFront(1);
console.log("双向队列 deque = ");
deque.printDeque();

/* 访问元素 */
const peekFirst: number = deque.peekFirst();
console.log("队首元素 peekFirst = " + peekFirst);
const peekLast: number = deque.peekLast();
console.log("队尾元素 peekLast = " + peekLast);

/* 元素出队 */
const popFront: number | undefined = deque.popFront();
console.log("队首出队元素 popFront = " + popFront + "，队首出队后 deque = ");
deque.printDeque();
const popBack: number | undefined = deque.popBack();
console.log("队尾出队元素 popBack = " + popBack + "，队尾出队后 deque = ");
deque.printDeque();

/* 获取双向队列的长度 */
const size: number = deque.size();
console.log("双向队列长度 size = " + size);

/* 判断双向队列是否为空 */
const isEmpty: boolean = deque.isEmpty();
console.log("双向队列是否为空 = " + isEmpty);

export { };