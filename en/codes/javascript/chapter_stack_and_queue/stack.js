/**
 * File: stack.js
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Initialize stack */
// JavaScript does not have a built-in stack class, but Array can be used as a stack
const stack = [];

/* Element push */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Stack stack =', stack);

/* Access stack top element */
const peek = stack[stack.length - 1];
console.log('Stack top element peek =', peek);

/* Element pop */
const pop = stack.pop();
console.log('Popped element pop =', pop);
console.log('Stack after pop =', stack);

/* Get the length of the stack */
const size = stack.length;
console.log('Stack length size =', size);

/* Determine if it's empty */
const isEmpty = stack.length === 0;
console.log('Is the stack empty =', isEmpty);
