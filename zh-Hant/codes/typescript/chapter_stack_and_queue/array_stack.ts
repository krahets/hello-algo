/**
 * File: array_stack.ts
 * Created Time: 2022-12-08
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 基于数组实现的栈 */
class ArrayStack {
    private stack: number[];
    constructor() {
        this.stack = [];
    }

    /* 获取栈的长度 */
    get size(): number {
        return this.stack.length;
    }

    /* 判断栈是否为空 */
    isEmpty(): boolean {
        return this.stack.length === 0;
    }

    /* 入栈 */
    push(num: number): void {
        this.stack.push(num);
    }

    /* 出栈 */
    pop(): number | undefined {
        if (this.isEmpty()) throw new Error('栈为空');
        return this.stack.pop();
    }

    /* 访问栈顶元素 */
    top(): number | undefined {
        if (this.isEmpty()) throw new Error('栈为空');
        return this.stack[this.stack.length - 1];
    }

    /* 返回 Array */
    toArray() {
        return this.stack;
    }
}

/* Driver Code */
/* 初始化栈 */
const stack = new ArrayStack();

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('栈 stack = ');
console.log(stack.toArray());

/* 访问栈顶元素 */
const top = stack.top();
console.log('栈顶元素 top = ' + top);

/* 元素出栈 */
const pop = stack.pop();
console.log('出栈元素 pop = ' + pop + '，出栈后 stack = ');
console.log(stack.toArray());

/* 获取栈的长度 */
const size = stack.size;
console.log('栈的长度 size = ' + size);

/* 判断是否为空 */
const isEmpty = stack.isEmpty();
console.log('栈是否为空 = ' + isEmpty);

export {};
