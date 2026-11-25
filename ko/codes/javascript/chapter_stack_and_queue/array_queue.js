/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
    #nums; // 큐의 원소를 저장하는 배열
    #front = 0; // 맨 앞 원소를 가리키는 앞쪽 포인터
    #queSize = 0; // 큐의 길이

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* 큐의 용량 조회 */
    get capacity() {
        return this.#nums.length;
    }

    /* 큐의 길이 조회 */
    get size() {
        return this.#queSize;
    }

    /* 큐가 비어 있는지 확인 */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* 큐에 삽입 */
    push(num) {
        if (this.size === this.capacity) {
            console.log('큐가 가득 찼다');
            return;
        }
        // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        // 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
        const rear = (this.#front + this.size) % this.capacity;
        // 맨 뒤에 num을 추가한다
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* 큐에서 꺼내기 */
    pop() {
        const num = this.peek();
        // 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* 맨 앞 원소 조회 */
    peek() {
        if (this.isEmpty()) throw new Error('큐가 비어 있다');
        return this.#nums[this.#front];
    }

    /* Array 반환 */
    toArray() {
        // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* 실행 예제 */
/* 큐 초기화 */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('큐 queue =', queue.toArray());

/* 맨 앞 원소 조회 */
const peek = queue.peek();
console.log('맨 앞 원소 peek = ' + peek);

/* 큐에서 원소 꺼내기 */
const pop = queue.pop();
console.log('꺼낸 원소 pop = ' + pop + ', 꺼낸 후 queue =', queue.toArray());

/* 큐의 길이 조회 */
const size = queue.size;
console.log('큐의 길이 size = ' + size);

/* 큐가 비어 있는지 확인 */
const isEmpty = queue.isEmpty();
console.log('큐가 비어 있는가 = ' + isEmpty);

/* 원형 배열 테스트 */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('반복 ' + i + ' — 삽입 + 삭제 후 queue =', queue.toArray());
}
