/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Driver Code */
/* Initialize hash table */
const map = new Map();

/* Add operation */
// Add key-value pair (key, value) to the hash table
map.set(12836, 'Ha');
map.set(15937, 'Luo');
map.set(16750, 'Suan');
map.set(13276, 'Fa');
map.set(10583, 'Ya');
console.info('\nAfter adding, the hash table is\nKey -> Value');
console.info(map);

/* Query operation */
// Enter key to the hash table, get value
let name = map.get(15937);
console.info('\nEnter student ID 15937, found name ' + name);

/* Remove operation */
// Remove key-value pair (key, value) from the hash table
map.delete(10583);
console.info('\nAfter removing 10583, the hash table is\nKey -> Value');
console.info(map);

/* Traverse hash table */
console.info('\nTraverse key-value pairs Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nIndividually traverse keys Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nIndividually traverse values Value');
for (const v of map.values()) {
    console.info(v);
}
