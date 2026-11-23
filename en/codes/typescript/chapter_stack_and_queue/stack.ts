/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver code */
/* Initialize the stack */
// TypeScript has no built-in stack class; an Array can be used as a stack
const stack: number[] = [];

/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Stack stack =', stack);

/* Access the top element */
const peek = stack[stack.length - 1];
console.log('Top element peek =', peek);

/* Pop an element from the stack */
const pop = stack.pop();
console.log('Popped element pop =', pop);
console.log('After popping, stack =', stack);

/* Get the stack size */
const size = stack.length;
console.log('Stack size =', size);

/* Check whether it is empty */
const isEmpty = stack.length === 0;
console.log('Is the stack empty =', isEmpty);

export {};
