/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 실행 코드 */
/* 큐 초기화 */
// JavaScript에는 내장 큐가 없으므로 Array를 큐로 사용할 수 있다
const queue = [];

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('큐 queue =', queue);

/* 맨 앞 원소 접근 */
const peek = queue[0];
console.log('맨 앞 원소 peek =', peek);

/* 큐에서 원소 꺼내기 */
// 내부 자료 구조가 배열이므로 shift() 메서드의 시간 복잡도는 O(n)이다
const pop = queue.shift();
console.log('큐에서 꺼낸 원소 pop =', pop, ', 큐에서 꺼낸 후 queue = ', queue);

/* 큐의 길이 반환 */
const size = queue.length;
console.log('큐 길이 size =', size);

/* 큐가 비어 있는지 판단 */
const isEmpty = queue.length === 0;
console.log('큐가 비어 있는가 = ', isEmpty);
