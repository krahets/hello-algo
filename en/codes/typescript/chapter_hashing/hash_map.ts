/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Driver Code */
/* Initialize hash table */
const map = new Map<number, string>();

/* Add operation */
// Add key-value pair (key, value) to the hash table
map.set(12836, 'Xiao Ha');
map.set(15937, 'Xiao Luo');
map.set(16750, 'Xiao Suan');
map.set(13276, 'Xiao Fa');
map.set(10583, 'Xiao Ya');
console.info('\nAfter adding is complete, hash table is\nKey -> Value');
console.info(map);

/* Query operation */
// Input key into hash table to get value
let name = map.get(15937);
console.info('\nInput student ID 15937, query name ' + name);

/* Remove operation */
// Remove key-value pair (key, value) from hash table
map.delete(10583);
console.info('\nAfter removing 10583, hash table is\nKey -> Value');
console.info(map);

/* Traverse hash table */
console.info('\nTraverse key-value pairs Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nTraverse keys only Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\nTraverse values only Value');
for (const v of map.values()) {
    console.info(v);
}

export {};
