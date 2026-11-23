/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 実行用コード */
/* ハッシュテーブルを初期化する */
const map = new Map<number, string>();

/* 追加操作 */
// ハッシュテーブルにキーと値のペア (key, value) を追加する
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n追加後のハッシュテーブル\nKey -> Value');
console.info(map);

/* 取得操作 */
// ハッシュテーブルにキー key を渡し、値 value を取得する
let name = map.get(15937);
console.info('\n学生番号 15937 に対応する氏名は ' + name);

/* 削除操作 */
// ハッシュテーブルからキーと値のペア (key, value) を削除する
map.delete(10583);
console.info('\n10583 を削除した後のハッシュテーブル\nKey -> Value');
console.info(map);

/* ハッシュテーブルを走査する */
console.info('\nキーと値のペア Key->Value を走査する');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nキー Key だけを走査する');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n値 Value だけを走査する');
for (const v of map.values()) {
    console.info(v);
}

export {};
