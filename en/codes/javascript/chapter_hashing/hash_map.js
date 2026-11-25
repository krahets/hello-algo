/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Driver code */
/* Initialize the hash table */
const map = new Map();

/* Insert a key-value pair */
// Insert the pair (key, value) into the hash table
map.set(12836, 'Xiao Ha');
map.set(15937, 'Xiao Luo');
map.set(16750, 'Xiao Suan');
map.set(13276, 'Xiao Fa');
map.set(10583, 'Xiao Ya');
console.info('\nHash table after insertion:\nKey -> Value');
console.info(map);

/* Look up a value */
// Look up key in the hash table to get value
let name = map.get(15937);
console.info('\nName for student ID 15937: ' + name);

/* Remove a key-value pair */
// Remove the pair (key, value) from the hash table
map.delete(10583);
console.info('\nHash table after removing 10583:\nKey -> Value');
console.info(map);

/* Iterate over the hash table */
console.info('\nIterate over key-value pairs (Key->Value)');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nIterate over keys only');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nIterate over values only');
for (const v of map.values()) {
    console.info(v);
}
