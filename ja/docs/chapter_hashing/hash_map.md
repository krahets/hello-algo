# ハッシュテーブル

<u>ハッシュテーブル（hash table）</u>は、<u>ハッシュ表</u>とも呼ばれます。キー `key` と値 `value` の対応を作り、要素を効率よく照会します。具体的には、キー `key` を入力すると、対応する値 `value` を $O(1)$ 時間で取得できます。

下図のように、$n$ 人の学生がおり、それぞれに名前と学籍番号があるとします。「学籍番号を入力すると対応する名前を返す」機能は、図のハッシュテーブルで実現できます。

![ハッシュテーブルの抽象的な表現](hash_map.assets/hash_table_lookup.png)

配列や連結リストでも照会機能を実現できます。効率の比較を下表に示します。

- **要素の追加**：配列（連結リスト）の末尾に追加するだけなので、$O(1)$ 時間です。
- **要素の照会**：配列（連結リスト）が未整列なので、すべての要素を走査する必要があり、$O(n)$ 時間です。
- **要素の削除**：まず要素を探してから配列（連結リスト）から削除するため、$O(n)$ 時間です。

<p align="center"> 表 <id> &nbsp; 要素の照会効率の比較 </p>

|          | 配列   | 連結リスト   | ハッシュテーブル |
| -------- | ------ | ------ | ------ |
| 要素の探索 | $O(n)$ | $O(n)$ | $O(1)$ |
| 要素の追加 | $O(1)$ | $O(1)$ | $O(1)$ |
| 要素の削除 | $O(n)$ | $O(n)$ | $O(1)$ |

**ハッシュテーブルの追加、削除、照会、更新は、すべて時間計算量が $O(1)$** で、非常に効率的です。

## ハッシュテーブルの主な操作

主な操作には、初期化、照会、キーと値のペアの追加や削除などがあります。コード例を示します。

=== "Python"

    ```python title="hash_map.py"
    # ハッシュテーブルを初期化
    hmap: dict = {}

    # 追加操作
    # ハッシュテーブルにペア (key, value) を追加
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"

    # 照会操作
    # キー key を入力して値 value を取得
    name: str = hmap[15937]

    # 削除操作
    # ハッシュテーブルからペア (key, value) を削除
    hmap.pop(10583)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* ハッシュテーブルを初期化 */
    unordered_map<int, string> map;

    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";

    /* 照会操作 */
    // キー key を入力して値 value を取得
    string name = map[15937];

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.erase(10583);
    ```

=== "Java"

    ```java title="hash_map.java"
    /* ハッシュテーブルを初期化 */
    Map<Integer, String> map = new HashMap<>();

    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");

    /* 照会操作 */
    // キー key を入力して値 value を取得
    String name = map.get(15937);

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.remove(10583);
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* ハッシュテーブルを初期化 */
    Dictionary<int, string> map = new() {
        /* 追加操作 */
        // ハッシュテーブルにペア (key, value) を追加
        { 12836, "小哈" },
        { 15937, "小啰" },
        { 16750, "小算" },
        { 13276, "小法" },
        { 10583, "小鸭" }
    };

    /* 照会操作 */
    // キー key を入力して値 value を取得
    string name = map[15937];

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.Remove(10583);
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* ハッシュテーブルを初期化 */
    hmap := make(map[int]string)

    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"

    /* 照会操作 */
    // キー key を入力して値 value を取得
    name := hmap[15937]

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    delete(hmap, 10583)
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* ハッシュテーブルを初期化 */
    var map: [Int: String] = [:]

    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"

    /* 照会操作 */
    // キー key を入力して値 value を取得
    let name = map[15937]!

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.removeValue(forKey: 10583)
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* ハッシュテーブルを初期化 */
    const map = new Map();
    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');

    /* 照会操作 */
    // キー key を入力して値 value を取得
    let name = map.get(15937);

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.delete(10583);
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* ハッシュテーブルを初期化 */
    const map = new Map<number, string>();
    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');
    console.info('\n追加後のハッシュテーブルは\nKey -> Value');
    console.info(map);

    /* 照会操作 */
    // キー key を入力して値 value を取得
    let name = map.get(15937);
    console.info('\n学籍番号 15937 を入力して得た名前は ' + name);

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.delete(10583);
    console.info('\n10583 を削除した後のハッシュテーブルは\nKey -> Value');
    console.info(map);
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* ハッシュテーブルを初期化 */
    Map<int, String> map = {};

    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";

    /* 照会操作 */
    // キー key を入力して値 value を取得
    String name = map[15937];

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.remove(10583);
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    use std::collections::HashMap;

    /* ハッシュテーブルを初期化 */
    let mut map: HashMap<i32, String> = HashMap::new();

    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map.insert(12836, "小哈".to_string());
    map.insert(15937, "小啰".to_string());
    map.insert(16750, "小算".to_string());
    map.insert(13279, "小法".to_string());
    map.insert(10583, "小鸭".to_string());

    /* 照会操作 */
    // キー key を入力して値 value を取得
    let _name: Option<&String> = map.get(&15937);

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    let _removed_value: Option<String> = map.remove(&10583);
    ```

=== "C"

    ```c title="hash_map.c"
    // C には組み込みのハッシュテーブルがない
    ```

=== "Kotlin"

    ```kotlin title="hash_map.kt"
    /* ハッシュテーブルを初期化 */
    val map = HashMap<Int,String>()

    /* 追加操作 */
    // ハッシュテーブルにペア (key, value) を追加
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"

    /* 照会操作 */
    // キー key を入力して値 value を取得
    val name = map[15937]

    /* 削除操作 */
    // ハッシュテーブルからペア (key, value) を削除
    map.remove(10583)
    ```

=== "Ruby"

    ```ruby title="hash_map.rb"
    # ハッシュテーブルを初期化
    hmap = {}

    # 追加操作
    # ハッシュテーブルにペア (key, value) を追加
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"

    # 照会操作
    # キー key を入力して値 value を取得
    name = hmap[15937]

    # 削除操作
    # ハッシュテーブルからペア (key, value) を削除
    hmap.delete(10583)
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E7%85%A7%E4%BC%9A%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%20key%20%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%A6%E5%80%A4%20value%20%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%89%8A%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%8B%E3%82%89%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20hmap.pop(10583)&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

ハッシュテーブルの主な走査方法は、キーと値のペアの走査、キーだけの走査、値だけの走査の三つです。コード例を示します。

=== "Python"

    ```python title="hash_map.py"
    # ハッシュテーブルを走査
    # キーと値のペアを走査 key->value
    for key, value in hmap.items():
        print(key, "->", value)
    # キーだけを走査 key
    for key in hmap.keys():
        print(key)
    # 値だけを走査 value
    for value in hmap.values():
        print(value)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 key->value
    for (auto kv: map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    // イテレータで走査 key->value
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }
    ```

=== "Java"

    ```java title="hash_map.java"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 key->value
    for (Map.Entry <Integer, String> kv: map.entrySet()) {
        System.out.println(kv.getKey() + " -> " + kv.getValue());
    }
    // キーだけを走査 key
    for (int key: map.keySet()) {
        System.out.println(key);
    }
    // 値だけを走査 value
    for (String val: map.values()) {
        System.out.println(val);
    }
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 Key->Value
    foreach (var kv in map) {
        Console.WriteLine(kv.Key + " -> " + kv.Value);
    }
    // キーだけを走査 key
    foreach (int key in map.Keys) {
        Console.WriteLine(key);
    }
    // 値だけを走査 value
    foreach (string val in map.Values) {
        Console.WriteLine(val);
    }
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 key->value
    for key, value := range hmap {
        fmt.Println(key, "->", value)
    }
    // キーだけを走査 key
    for key := range hmap {
        fmt.Println(key)
    }
    // 値だけを走査 value
    for _, value := range hmap {
        fmt.Println(value)
    }
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 Key->Value
    for (key, value) in map {
        print("\(key) -> \(value)")
    }
    // キーだけを走査 Key
    for key in map.keys {
        print(key)
    }
    // 値だけを走査 Value
    for value in map.values {
        print(value)
    }
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* ハッシュテーブルを走査 */
    console.info('\nキーと値のペアを走査 Key->Value');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\nキーだけを走査 Key');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n値だけを走査 Value');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* ハッシュテーブルを走査 */
    console.info('\nキーと値のペアを走査 Key->Value');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\nキーだけを走査 Key');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n値だけを走査 Value');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 Key->Value
    map.forEach((key, value) {
      print('$key -> $value');
    });

    // キーだけを走査 Key
    map.keys.forEach((key) {
      print(key);
    });

    // 値だけを走査 Value
    map.values.forEach((value) {
      print(value);
    });
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 Key->Value
    for (key, value) in &map {
        println!("{key} -> {value}");
    }

    // キーだけを走査 Key
    for key in map.keys() {
        println!("{key}");
    }

    // 値だけを走査 Value
    for value in map.values() {
        println!("{value}");
    }
    ```

=== "C"

    ```c title="hash_map.c"
    // C には組み込みのハッシュテーブルがない
    ```

=== "Kotlin"

    ```kotlin title="hash_map.kt"
    /* ハッシュテーブルを走査 */
    // キーと値のペアを走査 key->value
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // キーだけを走査 key
    for (key in map.keys) {
        println(key)
    }
    // 値だけを走査 value
    for (_val in map.values) {
        println(_val)
    }
    ```

=== "Ruby"

    ```ruby title="hash_map.rb"
    # ハッシュテーブルを走査
    # キーと値のペアを走査 key->value
    hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

    # キーだけを走査 key
    hmap.keys.each { |key| puts key }

    # 値だけを走査 value
    hmap.values.each { |val| puts val }
    ```

??? pythontutor "実行の可視化"

    https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BF%BD%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%81%AB%E3%83%9A%E3%82%A2%20(key%2C%20value)%20%E3%82%92%E8%BF%BD%E5%8A%A0%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%8F%E3%83%83%E3%82%B7%E3%83%A5%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E8%B5%B0%E6%9F%BB%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%E3%81%A8%E5%80%A4%E3%81%AE%E3%83%9A%E3%82%A2%E3%82%92%E8%B5%B0%E6%9F%BB%20key-%3Evalue%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items()%3A%0A%20%20%20%20%20%20%20%20print(key%2C%20%22-%3E%22%2C%20value)%0A%20%20%20%20%23%20%E3%82%AD%E3%83%BC%E3%81%A0%E3%81%91%E3%82%92%E8%B5%B0%E6%9F%BB%20key%0A%20%20%20%20for%20key%20in%20hmap.keys()%3A%0A%20%20%20%20%20%20%20%20print(key)%0A%20%20%20%20%23%20%E5%80%A4%E3%81%A0%E3%81%91%E3%82%92%E8%B5%B0%E6%9F%BB%20value%0A%20%20%20%20for%20value%20in%20hmap.values()%3A%0A%20%20%20%20%20%20%20%20print(value)&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## ハッシュテーブルの単純な実装

まず最も単純な場合として、**一つの配列だけでハッシュテーブルを実装します**。配列内の各格納場所を<u>バケット（bucket）</u>と呼び、それぞれにキーと値のペアを一つ格納できます。照会とは、`key` に対応するバケットを探し、そこから `value` を取得する操作です。

では、`key` から対応するバケットをどう見つけるのでしょうか。<u>ハッシュ関数（hash function）</u>を使います。その役割は、大きな入力空間を小さな出力空間へ写すことです。ハッシュテーブルでは、入力空間はすべての `key`、出力空間はすべてのバケット、つまり配列のインデックスです。言い換えると、`key` を入力すれば、**そのペアが配列のどこに格納されるかをハッシュ関数で求められます**。

`key` を入力したとき、ハッシュ関数の計算は次の二段階に分かれます。

1. 何らかのハッシュアルゴリズム `hash()` でハッシュ値を求めます。
2. ハッシュ値をバケット数（配列の長さ）`capacity` で割った余りを取り、対応するバケット（配列のインデックス）`index` を得ます。

```shell
index = hash(key) % capacity
```

その後、`index` でハッシュテーブル内の対応するバケットにアクセスし、`value` を取得できます。

配列の長さを `capacity = 100`、ハッシュアルゴリズムを `hash(key) = key` とすると、ハッシュ関数は `key % 100` です。下図では、学籍番号を `key`、名前を `value` として、その仕組みを示しています。

![ハッシュ関数の仕組み](hash_map.assets/hash_function.png)

以下は単純なハッシュテーブルの実装です。`key` と `value` をクラス `Pair` にまとめ、キーと値のペアを表しています。

```src
[file]{array_hash_map}-[class]{array_hash_map}-[func]{}
```

## ハッシュ衝突と容量拡張

本質的に、ハッシュ関数はすべての `key` からなる入力空間を、配列のすべてのインデックスからなる出力空間へ写します。入力空間は通常、出力空間よりはるかに大きいため、**理論上、複数の入力が同じ出力に対応する場合が必ずあります**。

上の例では、入力した `key` の下二桁が同じなら出力も同じです。例えば、学籍番号 12836 と 20336 の学生を照会すると、次のようになります。

```shell
12836 % 100 = 36
20336 % 100 = 36
```

下図では、二つの学籍番号が同じ名前を指しており、明らかに正しくありません。このように、複数の入力が同じ出力に対応することを<u>ハッシュ衝突（hash collision）</u>と呼びます。

![ハッシュ衝突の例](hash_map.assets/hash_collision.png)

容量 $n$ が大きいほど、複数の `key` が同じバケットに割り当てられる確率は低くなり、衝突が減ります。したがって、**ハッシュテーブルの容量を拡張して衝突を減らせます**。

下図では、拡張前にペア `(136, A)` と `(236, D)` が衝突していますが、拡張後には解消しています。

![ハッシュテーブルの容量拡張](hash_map.assets/hash_table_reshash.png)

配列の容量拡張と同様に、すべてのペアを古いハッシュテーブルから新しいものへ移す必要があり、非常に時間がかかります。さらに、`capacity` が変わるため、すべてのペアの格納位置をハッシュ関数で再計算する必要があり、計算負荷が増えます。そのため、言語の実装では通常、十分な容量をあらかじめ確保して、頻繁な拡張を防ぎます。

<u>負荷率（load factor）</u>は重要な概念で、要素数をバケット数で割った値です。衝突の程度を測るために使い、**容量拡張を開始する条件にもよく用います**。例えば Java では、負荷率が $0.75$ を超えると、容量を元の $2$ 倍に拡張します。
