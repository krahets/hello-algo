/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver code */
/* Initialize the stack */
// TypeScript has no built-in stack class, so use an Array as a stack
const stack: number[] = [];

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('stack =', stack);

/* Peek at the top element */
const peek = stack[stack.length - 1];
console.log('Top element (peek) =', peek);

/* Pop the top element */
const pop = stack.pop();
console.log('Popped element (pop) =', pop);
console.log('After the pop, stack =', stack);

/* Get the stack size */
const size = stack.length;
console.log('Stack size =', size);

/* Check whether the stack is empty */
const isEmpty = stack.length === 0;
console.log('Stack is empty =', isEmpty);

export {};
