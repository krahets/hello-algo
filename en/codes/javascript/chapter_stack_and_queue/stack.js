/**
 * File: stack.js
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver code */
// [region]{init_stack}
/* Initialize the stack */
// JavaScript has no built-in stack class; an Array can be used as a stack
const stack = [];
// [endregion]{init_stack}

// [region]{push}
/* Push elements onto the stack */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
// [endregion]{push}
console.log('Stack stack =', stack);

// [region]{peek}
/* Access the top element */
const peek = stack[stack.length - 1];
// [endregion]{peek}
console.log('Top element peek =', peek);

// [region]{pop}
/* Pop an element from the stack */
const pop = stack.pop();
// [endregion]{pop}
console.log('Popped element pop =', pop);
console.log('After popping, stack =', stack);

// [region]{size}
/* Get the stack size */
const size = stack.length;
// [endregion]{size}
console.log('Stack size =', size);

// [region]{is_empty}
/* Check whether it is empty */
const isEmpty = stack.length === 0;
// [endregion]{is_empty}
console.log('Is the stack empty =', isEmpty);
