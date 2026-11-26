/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 実行例 */
/* ハッシュ表を初期化する */
const map = new Map<number, string>();

/* 追加 */
// ハッシュ表にペア (key, value) を追加する
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n追加後のハッシュ表\nKey -> Value');
console.info(map);

/* 検索 */
// ハッシュ表でキー key に対応する値 value を取得する
let name = map.get(15937);
console.info('\n学籍番号 15937 に対応する名前は ' + name);

/* 削除 */
// ハッシュ表からペア (key, value) を削除する
map.delete(10583);
console.info('\n10583 を削除した後のハッシュ表\nKey -> Value');
console.info(map);

/* ハッシュ表を走査する */
console.info('\nキーと値のペアを順に表示 Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nキーだけを順に表示 Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n値だけを順に表示 Value');
for (const v of map.values()) {
    console.info(v);
}

export {};
