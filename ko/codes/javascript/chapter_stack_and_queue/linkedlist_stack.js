/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* 연결 리스트로 구현한 스택 */
class LinkedListStack {
    #stackPeek; // 머리 노드를 스택의 맨 위로 사용한다
    #stkSize = 0; // 스택의 길이

    constructor() {
        this.#stackPeek = null;
    }

    /* 스택의 길이 반환 */
    get size() {
        return this.#stkSize;
    }

    /* 스택이 비어 있는지 판단 */
    isEmpty() {
        return this.size === 0;
    }

    /* 스택에 삽입 */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* 스택에서 꺼내기 */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* 스택 맨 위 원소 접근 */
    peek() {
        if (!this.#stackPeek) throw new Error('스택이 비어 있다');
        return this.#stackPeek.val;
    }

    /* 연결 리스트를 Array로 변환하여 반환 */
    toArray() {
        let node = this.#stackPeek;
        const res = new Array(this.size);
        for (let i = res.length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

/* 실행 코드 */
/* 스택 초기화 */
const stack = new LinkedListStack();

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('스택 stack = ' + stack.toArray());

/* 스택 맨 위 원소 접근 */
const peek = stack.peek();
console.log('스택 맨 위 원소 peek = ' + peek);

/* 스택에서 원소 꺼내기 */
const pop = stack.pop();
console.log('스택에서 꺼낸 원소 pop = ' + pop + ', 스택에서 꺼낸 후 stack = ' + stack.toArray());

/* 스택의 길이 반환 */
const size = stack.size;
console.log('스택의 길이 size = ' + size);

/* 비어 있는지 판단 */
const isEmpty = stack.isEmpty();
console.log('스택이 비어 있는가 = ' + isEmpty);
