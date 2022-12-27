/**
 * File: array_queue.ts
 * Created Time: 2022-12-11
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */


/* 基于环形数组实现的队列 */
class ArrayQueue {
    private queue: number[];     // 用于存储队列元素的数组
    private front: number = 0;  // 头指针，指向队首
    private rear: number = 0;   // 尾指针，指向队尾 + 1
    private CAPACITY: number = 1e5;

    constructor(capacity?: number) {
        this.queue = new Array<number>(capacity ?? this.CAPACITY);
    }

    /* 获取队列的容量 */
    get capacity(): number {
        return this.queue.length;
    }

    /* 获取队列的长度 */
    get size(): number {
        // 由于将数组看作为环形，可能 rear < front ，因此需要取余数
        return (this.capacity + this.rear - this.front) % this.capacity;
    }

    /* 判断队列是否为空 */
    empty(): boolean {
        return this.rear - this.front == 0;
    }

    /* 入队 */
    offer(num: number): void {
        if (this.size == this.capacity)
            throw new Error("队列已满");
        // 尾结点后添加 num
        this.queue[this.rear] = num;
        // 尾指针向后移动一位，越过尾部后返回到数组头部
        this.rear = (this.rear + 1) % this.capacity;
    }

    /* 出队 */
    poll(): number {
        const num = this.peek();
        // 队头指针向后移动一位，若越过尾部则返回到数组头部
        this.front = (this.front + 1) % this.capacity;
        return num;
    }

    /* 访问队首元素 */
    peek(): number {
        if (this.empty())
            throw new Error("队列为空");
        return this.queue[this.front];
    }

    /* 返回 Array */
    toArray(): number[] {
        const siz = this.size;
        const cap = this.capacity;
        // 仅转换有效长度范围内的列表元素
        const arr = new Array(siz);
        for (let i = 0, j = this.front; i < siz; i++, j++) {
            arr[i] = this.queue[j % cap];
        }
        return arr;
    }
}

/* 初始化队列 */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 元素入队 */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);
console.log("队列 queue = ");
console.log(queue.toArray());

/* 访问队首元素 */
const peek = queue.peek();
console.log("队首元素 peek = " + peek);

/* 元素出队 */
const poll = queue.poll();
console.log("出队元素 poll = " + poll + "，出队后 queue = ");
console.log(queue.toArray());

/* 获取队列的长度 */
const size = queue.size;
console.log("队列长度 size = " + size);

/* 判断队列是否为空 */
const empty = queue.empty();
console.log("队列是否为空 = " + empty);

/* 测试环形数组 */
for (let i = 0; i < 10; i++) {
    queue.offer(i);
    queue.poll();
    console.log("第 " + i + " 轮入队 + 出队后 queue = ");
    console.log(queue.toArray());
}

export { };