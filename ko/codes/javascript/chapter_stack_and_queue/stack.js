/**
 * File: stack.js
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 실행 예제 */
/* 스택 초기화 */
// JavaScript에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
const stack = [];

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('스택 stack =', stack);

/* 스택 맨 위의 원소 조회 */
const peek = stack[stack.length - 1];
console.log('맨 위 원소 peek =', peek);

/* 스택에서 원소 꺼내기 */
const pop = stack.pop();
console.log('꺼낸 원소 pop =', pop);
console.log('꺼낸 후 stack =', stack);

/* 스택의 길이 조회 */
const size = stack.length;
console.log('스택의 길이 size =', size);

/* 비어 있는지 확인 */
const isEmpty = stack.length === 0;
console.log('스택이 비어 있는가 =', isEmpty);
