/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* 実行用コード */
// [region]{init_hash_map}
/* ハッシュテーブルを初期化する */
const map = new Map();
// [endregion]{init_hash_map}

// [region]{add_pairs}
/* 追加操作 */
// ハッシュテーブルにキーと値のペア (key, value) を追加する
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
// [endregion]{add_pairs}
console.info('\n追加後のハッシュテーブル\nKey -> Value');
console.info(map);

// [region]{get_value}
/* 取得操作 */
// ハッシュテーブルにキー key を渡し、値 value を取得する
let name = map.get(15937);
// [endregion]{get_value}
console.info('\n学生番号 15937 に対応する氏名は ' + name);

// [region]{remove_pair}
/* 削除操作 */
// ハッシュテーブルからキーと値のペア (key, value) を削除する
map.delete(10583);
// [endregion]{remove_pair}
console.info('\n10583 を削除した後のハッシュテーブル\nKey -> Value');
console.info(map);

console.info('\nキーと値のペア Key->Value を走査する');
// [region]{iterate_pairs}
/* ハッシュテーブルを走査する */
// キーと値のペア key->value を走査する
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
// [endregion]{iterate_pairs}

console.info('\nキー Key だけを走査する');
// [region]{iterate_keys}
// キー key だけを走査する
for (const k of map.keys()) {
    console.info(k);
}
// [endregion]{iterate_keys}

console.info('\n値 Value だけを走査する');
// [region]{iterate_values}
// 値 value だけを走査する
for (const v of map.values()) {
    console.info(v);
}
// [endregion]{iterate_values}
