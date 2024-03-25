/**
 * File: hash_map_chaining.js
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 鍵值對 Number -> String */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* 鏈式位址雜湊表 */
class HashMapChaining {
    #size; // 鍵值對數量
    #capacity; // 雜湊表容量
    #loadThres; // 觸發擴容的負載因子閾值
    #extendRatio; // 擴容倍數
    #buckets; // 桶陣列

    /* 建構子 */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* 雜湊函式 */
    #hashFunc(key) {
        return key % this.#capacity;
    }

    /* 負載因子 */
    #loadFactor() {
        return this.#size / this.#capacity;
    }

    /* 查詢操作 */
    get(key) {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 走訪桶，若找到 key ，則返回對應 val
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // 若未找到 key ，則返回 null
        return null;
    }

    /* 新增操作 */
    put(key, val) {
        // 當負載因子超過閾值時，執行擴容
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 走訪桶，若遇到指定 key ，則更新對應 val 並返回
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // 若無該 key ，則將鍵值對新增至尾部
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* 刪除操作 */
    remove(key) {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // 走訪桶，從中刪除鍵值對
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* 擴容雜湊表 */
    #extend() {
        // 暫存原雜湊表
        const bucketsTmp = this.#buckets;
        // 初始化擴容後的新雜湊表
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // 將鍵值對從原雜湊表搬運至新雜湊表
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* 列印雜湊表 */
    print() {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* Driver Code */
/* 初始化雜湊表 */
const map = new HashMapChaining();

/* 新增操作 */
// 在雜湊表中新增鍵值對 (key, value)
map.put(12836, '小哈');
map.put(15937, '小囉');
map.put(16750, '小算');
map.put(13276, '小法');
map.put(10583, '小鴨');
console.log('\n新增完成後，雜湊表為\nKey -> Value');
map.print();

/* 查詢操作 */
// 向雜湊表中輸入鍵 key ，得到值 value
const name = map.get(13276);
console.log('\n輸入學號 13276 ，查詢到姓名 ' + name);

/* 刪除操作 */
// 在雜湊表中刪除鍵值對 (key, value)
map.remove(12836);
console.log('\n刪除 12836 後，雜湊表為\nKey -> Value');
map.print();
