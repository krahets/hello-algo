/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 실행 예제 */
/* 덱 초기화 */
// TypeScript에는 내장 덱이 없어 Array를 덱으로 대신 사용해야 한다
const deque: number[] = [];

/* 덱에 원소 삽입 */
deque.push(2);
deque.push(5);
deque.push(4);
// 배열을 사용하므로 unshift() 메서드의 시간 복잡도는 O(n)이다
deque.unshift(3);
deque.unshift(1);
console.log('덱 deque = ', deque);

/* 원소 조회 */
const peekFirst: number = deque[0];
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast: number = deque[deque.length - 1];
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 덱에서 원소 꺼내기 */
// 배열을 사용하므로 shift() 메서드의 시간 복잡도는 O(n)이다
const popFront: number = deque.shift() as number;
console.log(
    '맨 앞에서 꺼낸 원소 popFront = ' + popFront + ', 맨 앞에서 꺼낸 후 deque = ' + deque
);
const popBack: number = deque.pop() as number;
console.log(
    '맨 뒤에서 꺼낸 원소 popBack = ' + popBack + ', 맨 뒤에서 꺼낸 후 deque = ' + deque
);

/* 덱의 길이 조회 */
const size: number = deque.length;
console.log('덱의 길이 size = ' + size);

/* 덱이 비어 있는지 확인 */
const isEmpty: boolean = size === 0;
console.log('덱이 비어 있는가 = ' + isEmpty);

export {};
