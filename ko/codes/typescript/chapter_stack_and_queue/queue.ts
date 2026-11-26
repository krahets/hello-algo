/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 실행 예제 */
/* 큐 초기화 */
// TypeScript에는 내장 큐가 없으므로 Array를 큐로 사용할 수 있다
const queue: number[] = [];

/* 큐에 원소 삽입 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('큐 queue =', queue);

/* 맨 앞 원소 조회 */
const peek = queue[0];
console.log('맨 앞 원소 peek =', peek);

/* 큐에서 원소 꺼내기 */
// 배열을 기반으로 하므로 shift() 메서드의 시간 복잡도는 O(n)이다
const pop = queue.shift();
console.log('꺼낸 원소 pop =', pop, ', 꺼낸 후 queue = ', queue);

/* 큐의 길이 조회 */
const size = queue.length;
console.log('큐의 길이 size =', size);

/* 큐가 비어 있는지 확인 */
const isEmpty = queue.length === 0;
console.log('큐가 비어 있는가 = ', isEmpty);

export {};
