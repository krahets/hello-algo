/*
 * File: array_hash_map.ts
 * Created Time: 2022-12-29
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 键值对 Number -> String */
class Entry {
  public key: number;
  public val: string;
  constructor(key: number, val: string) {
    this.key = key;
    this.val = val;
  }
}

/* 数组的初始化和基本操作 */
class ArrayList {

  private readonly elements: Entry[];
  constructor(length: number) {
    this.elements = new Array(length);
    this.initialize();
  }

  /* 初始化 */
  private initialize() {
    this.elements.fill(null as any, 0, this.elements.length - 1);
  }

  /* 新增和删除 */
  public set(key: number, val: string | null) {
    if (val !== null) {
      this.elements[key] = new Entry(key, val);
    } else {
      this.elements[key] = null as any;
    }
  }

  /* 获取 */
  public get(key: number): string | null {
    if (this.elements[key] instanceof Entry) {
      return this.elements[key].val;
    }
    return null;
  }

  public entrySet() {
    let arr = [];
    for (let i = 0; i < this.elements.length; i++) {
      if (this.elements[i]) {
        arr.push(this.elements[i]);
      }
    }
    return arr;
  }

  public valueSet() {
    let arr = [];
    for (let i = 0; i < this.elements.length; i++) {
      if (this.elements[i]) {
        arr.push(this.elements[i].val);
      }
    }
    return arr;
  }

  public keySet() {
    let arr = [];
    for (let i = 0; i < this.elements.length; i++) {
      if (this.elements[i]) {
        arr.push(this.elements[i].key);
      }
    }
    return arr;
  }
}

/* 基于数组简易实现的哈希表 */
class ArrayHashMap {
  // 初始化一个长度为 100 的桶（数组）
  private bucket: ArrayList;

  constructor() {
    this.bucket = new ArrayList(100);
  }

  /* 哈希函数 */
  private hashFunc(key: number): number {
    return key % 100;
  }

  /* 查询操作 */
  public get(key: number): string | null {
    let index = this.hashFunc(key);
    let val = this.bucket.get(index);
    if (val === null) return null;
    return val;
  }

  /* 添加操作 */
  public put(key: number, val: string) {
    let index = this.hashFunc(key);
    this.bucket.set(index, val);
  }

  /* 删除操作 */
  public remove(key: number) {
    let index = this.hashFunc(key);
    // 置为 null ，代表删除
    this.bucket.set(index, null);
  }

  /* 获取所有键值对 */
  public entrySet(): Entry[] {
    return this.bucket.entrySet();
  }

  /* 获取所有键 */
  public keySet(): number[] {
    return this.bucket.keySet();
  }

  /* 获取所有值 */
  public valueSet(): string[] {
    return this.bucket.valueSet();
  }

/* 打印哈希表 */
  public print() {
    let entrySet = this.entrySet();
    for (const entry of entrySet) {
      if (!entry) continue;
      console.info(`${entry.key} -> ${entry.val}`);
    }
  }
}

export default ArrayHashMap;
