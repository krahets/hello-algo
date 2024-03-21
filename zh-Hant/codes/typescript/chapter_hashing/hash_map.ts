/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Driver Code */
/* 初始化哈希表 */
const map = new Map<number, string>();

/* 添加操作 */
// 在哈希表中添加键值对 (key, value)
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n添加完成后，哈希表为\nKey -> Value');
console.info(map);

/* 查询操作 */
// 向哈希表中输入键 key ，得到值 value
let name = map.get(15937);
console.info('\n输入学号 15937 ，查询到姓名 ' + name);

/* 删除操作 */
// 在哈希表中删除键值对 (key, value)
map.delete(10583);
console.info('\n删除 10583 后，哈希表为\nKey -> Value');
console.info(map);

/* 遍历哈希表 */
console.info('\n遍历键值对 Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\n单独遍历键 Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n单独遍历值 Value');
for (const v of map.values()) {
    console.info(v);
}

export {};
