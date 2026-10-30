/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Driver code */
/* Initialize the hash table */
const map = new Map();

/* Insert operation */
// Insert the key-value pair (key, value) into the hash table
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\nHash table after insertion:\nKey -> Value');
console.info(map);

/* Lookup operation */
// Look up key in the hash table to obtain value
let name = map.get(15937);
console.info('\nLook up student ID 15937 to obtain the name ' + name);

/* Remove operation */
// Remove the key-value pair (key, value) from the hash table
map.delete(10583);
console.info('\nHash table after removing 10583:\nKey -> Value');
console.info(map);

/* Traverse the hash table */
console.info('\nTraverse key-value pairs: Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nTraverse keys only: Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nTraverse values only: Value');
for (const v of map.values()) {
    console.info(v);
}
