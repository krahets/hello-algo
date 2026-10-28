/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 원형 배열로 구현한 덱 */
class ArrayDeque {
    #nums; // 덱의 원소를 저장하는 배열
    #front; // 맨 앞 원소를 가리키는 맨 앞 포인터
    #queSize; // 덱 길이

    /* 생성자 */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* 덱의 용량 반환 */
    capacity() {
        return this.#nums.length;
    }

    /* 덱의 길이 반환 */
    size() {
        return this.#queSize;
    }

    /* 덱이 비어 있는지 판단 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 원형 배열 인덱스 계산 */
    index(i) {
        // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
        // i가 배열의 끝을 넘어가면 처음으로 돌아온다
        // i가 배열의 처음을 넘어가면 끝으로 돌아온다
        return (i + this.capacity()) % this.capacity();
    }

    /* 맨 앞에 삽입 */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('덱이 가득 찼다');
            return;
        }
        // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
        // 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
        this.#front = this.index(this.#front - 1);
        // num을 맨 앞에 추가한다
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* 맨 뒤에 삽입 */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('덱이 가득 찼다');
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        const rear = this.index(this.#front + this.#queSize);
        // num을 맨 뒤에 추가한다
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* 맨 앞에서 꺼내기 */
    popFirst() {
        const num = this.peekFirst();
        // 맨 앞 포인터를 뒤로 한 칸 이동한다
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* 맨 뒤에서 꺼내기 */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    peekFirst() {
        if (this.isEmpty()) throw new Error('덱이 비어 있다.');
        return this.#nums[this.#front];
    }

    /* 맨 뒤 원소 접근 */
    peekLast() {
        if (this.isEmpty()) throw new Error('덱이 비어 있다.');
        // 마지막 원소의 인덱스를 계산한다
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* 출력에 사용할 배열 반환 */
    toArray() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* 실행 코드 */
/* 덱 초기화 */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('덱 deque = [' + deque.toArray() + ']');

/* 원소 접근 */
const peekFirst = deque.peekFirst();
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 큐에 원소 삽입 */
deque.pushLast(4);
console.log('뒤쪽에 원소 4를 삽입한 후 deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('앞쪽에 원소 1을 삽입한 후 deque = [' + deque.toArray() + ']');

/* 큐에서 원소 꺼내기 */
const popLast = deque.popLast();
console.log(
    '맨 뒤에서 꺼낸 원소 = ' +
        popLast +
        ', 뒤쪽 원소를 꺼낸 후 deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    '맨 앞에서 꺼낸 원소 = ' +
        popFirst +
        ', 앞쪽 원소를 꺼낸 후 deque = [' +
        deque.toArray() +
        ']'
);

/* 덱의 길이 반환 */
const size = deque.size();
console.log('덱 길이 size = ' + size);

/* 덱이 비어 있는지 판단 */
const isEmpty = deque.isEmpty();
console.log('덱이 비어 있는가 = ' + isEmpty);
