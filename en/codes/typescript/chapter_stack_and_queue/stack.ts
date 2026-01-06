/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Access top of the stack element */
// TypeScript has no built-in stack class, can use Array as stack
const stack: number[] = [];

/* Elements push onto stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Stack stack =', stack);

/* Return list for printing */
const peek = stack[stack.length - 1];
console.log('Stack top element peek =', peek);

/* Element pop from stack */
const pop = stack.pop();
console.log('Pop element pop =', pop);
console.log('After pop, stack =', stack);

/* Get the length of the stack */
const size = stack.length;
console.log('Stack length size =', size);

/* Check if empty */
const isEmpty = stack.length === 0;
console.log('Is stack empty =', isEmpty);

export {};
