/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Driver Code */
/* 初始化雜湊表 */
const map = new Map();

/* 新增操作 */
// 在雜湊表中新增鍵值對 (key, value)
map.set(12836, '小哈');
map.set(15937, '小囉');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鴨');
console.info('\n新增完成後，雜湊表為\nKey -> Value');
console.info(map);

/* 查詢操作 */
// 向雜湊表中輸入鍵 key ，得到值 value
let name = map.get(15937);
console.info('\n輸入學號 15937 ，查詢到姓名 ' + name);

/* 刪除操作 */
// 在雜湊表中刪除鍵值對 (key, value)
map.delete(10583);
console.info('\n刪除 10583 後，雜湊表為\nKey -> Value');
console.info(map);

/* 走訪雜湊表 */
console.info('\n走訪鍵值對 Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\n單獨走訪鍵 Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n單獨走訪值 Value');
for (const v of map.values()) {
    console.info(v);
}
