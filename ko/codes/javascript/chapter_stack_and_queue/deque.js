/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 실행 코드 */
/* 덱 초기화 */
// JavaScript에는 내장 덱이 없으므로 Array를 덱으로 사용한다
const deque = [];

/* 큐에 원소 삽입 */
deque.push(2);
deque.push(5);
deque.push(4);
// 배열이므로 unshift() 메서드의 시간 복잡도는 O(n)임에 유의한다
deque.unshift(3);
deque.unshift(1);
console.log('덱 deque = ', deque);

/* 원소 접근 */
const peekFirst = deque[0];
console.log('맨 앞 원소 peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('맨 뒤 원소 peekLast = ' + peekLast);

/* 큐에서 원소 꺼내기 */
// 배열이므로 shift() 메서드의 시간 복잡도는 O(n)임에 유의한다
const popFront = deque.shift();
console.log(
    '맨 앞에서 꺼낸 원소 popFront = ' + popFront + ', 맨 앞에서 꺼낸 후 deque = ' + deque
);
const popBack = deque.pop();
console.log(
    '뒤쪽에서 꺼낸 원소 popBack = ' + popBack + ', 맨 뒤에서 꺼낸 후 deque = ' + deque
);

/* 덱의 길이 반환 */
const size = deque.length;
console.log('덱 길이 size = ' + size);

/* 덱이 비어 있는지 판단 */
const isEmpty = size === 0;
console.log('덱이 비어 있는가 = ' + isEmpty);
