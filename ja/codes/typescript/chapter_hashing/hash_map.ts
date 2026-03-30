/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Driver Code */
/* ハッシュテーブルを初期化 */
const map = new Map<number, string>();

/* 追加操作 */
// ハッシュテーブルにキーと値のペア (key, value) を追加
map.set(12836, 'シャオハー');
map.set(15937, 'シャオルオ');
map.set(16750, 'シャオスワン');
map.set(13276, 'シャオファー');
map.set(10583, 'シャオヤー');
console.info('\n追加完了後，ハッシュテーブルは\nKey -> Value');
console.info(map);

/* 検索操作 */
// キー key をハッシュテーブルに渡し、値 value を取得
let name = map.get(15937);
console.info('\n学籍番号 15937 を入力し，見つかった氏名 ' + name);

/* 削除操作 */
// ハッシュテーブルからキーと値のペア (key, value) を削除
map.delete(10583);
console.info('\n10583 を削除した後，ハッシュテーブルは\nKey -> Value');
console.info(map);

/* ハッシュテーブルを走査 */
console.info('\nキーと値の組 Key->Value を走査');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\nキー Key を個別に走査');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n値 Value を個別に走査');
for (const v of map.values()) {
    console.info(v);
}

export {};
