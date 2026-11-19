/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Driver Code */
// [region]{init_hash_map}
/* 初始化雜湊表 */
const map = new Map<number, string>();
// [endregion]{init_hash_map}

// [region]{add_pairs}
/* 新增操作 */
// 在雜湊表中新增鍵值對 (key, value)
map.set(12836, '小哈');
map.set(15937, '小囉');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鴨');
// [endregion]{add_pairs}
console.info('\n新增完成後，雜湊表為\nKey -> Value');
console.info(map);

// [region]{get_value}
/* 查詢操作 */
// 向雜湊表中輸入鍵 key ，得到值 value
let name = map.get(15937);
// [endregion]{get_value}
console.info('\n輸入學號 15937 ，查詢到姓名 ' + name);

// [region]{remove_pair}
/* 刪除操作 */
// 在雜湊表中刪除鍵值對 (key, value)
map.delete(10583);
// [endregion]{remove_pair}
console.info('\n刪除 10583 後，雜湊表為\nKey -> Value');
console.info(map);

console.info('\n走訪鍵值對 Key->Value');
// [region]{iterate_pairs}
/* 走訪雜湊表 */
// 走訪鍵值對 key->value
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
// [endregion]{iterate_pairs}

console.info('\n單獨走訪鍵 Key');
// [region]{iterate_keys}
// 單獨走訪鍵 key
for (const k of map.keys()) {
    console.info(k);
}
// [endregion]{iterate_keys}

console.info('\n單獨走訪值 Value');
// [region]{iterate_values}
// 單獨走訪值 value
for (const v of map.values()) {
    console.info(v);
}
// [endregion]{iterate_values}

export {};
