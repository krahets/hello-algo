/**
 * File: array_stack.js
 * Created Time: 2022-12-09
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 배열로 구현한 스택 */
class ArrayStack {
    #stack;
    constructor() {
        this.#stack = [];
    }

    /* 스택의 길이 반환 */
    get size() {
        return this.#stack.length;
    }

    /* 스택이 비어 있는지 판단 */
    isEmpty() {
        return this.#stack.length === 0;
    }

    /* 스택에 삽입 */
    push(num) {
        this.#stack.push(num);
    }

    /* 스택에서 꺼내기 */
    pop() {
        if (this.isEmpty()) throw new Error('스택이 비어 있다');
        return this.#stack.pop();
    }

    /* 스택 맨 위 원소 접근 */
    top() {
        if (this.isEmpty()) throw new Error('스택이 비어 있다');
        return this.#stack[this.#stack.length - 1];
    }

    /* Array를 반환한다 */
    toArray() {
        return this.#stack;
    }
}

/* 실행 코드 */
/* 스택 초기화 */
const stack = new ArrayStack();

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('스택 stack = ');
console.log(stack.toArray());

/* 스택 맨 위 원소 접근 */
const top = stack.top();
console.log('스택의 맨 위 원소 top = ' + top);

/* 스택에서 원소 꺼내기 */
const pop = stack.pop();
console.log('스택에서 꺼낸 원소 pop = ' + pop + ', 스택에서 꺼낸 후 stack = ');
console.log(stack.toArray());

/* 스택의 길이 반환 */
const size = stack.size;
console.log('스택의 길이 size = ' + size);

/* 비어 있는지 판단 */
const isEmpty = stack.isEmpty();
console.log('스택이 비어 있는가 = ' + isEmpty);
