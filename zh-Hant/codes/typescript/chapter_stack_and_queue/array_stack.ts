/**
 * File: array_stack.ts
 * Created Time: 2022-12-08
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 基於陣列實現的堆疊 */
class ArrayStack {
    private stack: number[];
    constructor() {
        this.stack = [];
    }

    /* 獲取堆疊的長度 */
    get size(): number {
        return this.stack.length;
    }

    /* 判斷堆疊是否為空 */
    isEmpty(): boolean {
        return this.stack.length === 0;
    }

    /* 入堆疊 */
    push(num: number): void {
        this.stack.push(num);
    }

    /* 出堆疊 */
    pop(): number | undefined {
        if (this.isEmpty()) throw new Error('堆疊為空');
        return this.stack.pop();
    }

    /* 訪問堆疊頂元素 */
    top(): number | undefined {
        if (this.isEmpty()) throw new Error('堆疊為空');
        return this.stack[this.stack.length - 1];
    }

    /* 返回 Array */
    toArray() {
        return this.stack;
    }
}

/* Driver Code */
/* 初始化堆疊 */
const stack = new ArrayStack();

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('堆疊 stack = ');
console.log(stack.toArray());

/* 訪問堆疊頂元素 */
const top = stack.top();
console.log('堆疊頂元素 top = ' + top);

/* 元素出堆疊 */
const pop = stack.pop();
console.log('出堆疊元素 pop = ' + pop + '，出堆疊後 stack = ');
console.log(stack.toArray());

/* 獲取堆疊的長度 */
const size = stack.size;
console.log('堆疊的長度 size = ' + size);

/* 判斷是否為空 */
const isEmpty = stack.isEmpty();
console.log('堆疊是否為空 = ' + isEmpty);

export {};
