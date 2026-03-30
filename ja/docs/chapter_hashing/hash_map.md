# ハッシュテーブル

<u>ハッシュテーブル（hash table）</u>は、<u>散列表</u>とも呼ばれ、キー `key` と値 `value` の対応関係を構築することで、高効率な要素検索を実現します。具体的には、ハッシュテーブルにキー `key` を入力すると、対応する値 `value` を $O(1)$ 時間で取得できます。

以下の図に示すように、$n$ 人の学生がいるとし、各学生は「名前」と「学籍番号」の 2 つの情報を持っています。もし「学籍番号を入力すると対応する名前を返す」という検索機能を実現したいなら、下図のようなハッシュテーブルを用いることができます。

![ハッシュテーブルの抽象表現](hash_map.assets/hash_table_lookup.png)

ハッシュテーブルのほかに、配列や連結リストでも検索機能を実現できます。それらの効率比較を次の表に示します。

- **要素の追加**：要素を配列（連結リスト）の末尾に追加するだけでよく、$O(1)$ 時間です。
- **要素の検索**：配列（連結リスト）は無秩序なので、すべての要素を走査する必要があり、$O(n)$ 時間かかります。
- **要素の削除**：先に要素を検索してから配列（連結リスト）から削除する必要があり、$O(n)$ 時間かかります。

<p align="center"> 表 <id> &nbsp; 要素検索効率の比較 </p>

|          | 配列   | 連結リスト | ハッシュテーブル |
| -------- | ------ | ------ | ------ |
| 要素の検索 | $O(n)$ | $O(n)$ | $O(1)$ |
| 要素の追加 | $O(1)$ | $O(1)$ | $O(1)$ |
| 要素の削除 | $O(n)$ | $O(n)$ | $O(1)$ |

以上から分かるように、**ハッシュテーブルにおける追加・削除・検索・更新の時間計算量はいずれも $O(1)$** であり、非常に高効率です。

## ハッシュテーブルの基本操作

ハッシュテーブルの一般的な操作には、初期化、検索、キーと値のペアの追加、キーと値のペアの削除などがあります。コード例は以下のとおりです：

=== "Python"

    ```python title="hash_map.py"
    # ハッシュテーブルを初期化
    hmap: dict = {}

    # 追加操作
    # ハッシュテーブルにキーと値のペア (key, value) を追加
    hmap[12836] = "シャオハ"
    hmap[15937] = "シャオルオ"
    hmap[16750] = "シャオスワン"
    hmap[13276] = "シャオファ"
    hmap[10583] = "シャオヤー"

    # 検索操作
    # ハッシュテーブルにキー key を入力し、値 value を取得
    name: str = hmap[15937]

    # 削除操作
    # ハッシュテーブルからキーと値のペア (key, value) を削除
    hmap.pop(10583)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* ハッシュテーブルを初期化 */
    unordered_map<int, string> map;

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map[12836] = "シャオハ";
    map[15937] = "シャオルオ";
    map[16750] = "シャオスワン";
    map[13276] = "シャオファ";
    map[10583] = "シャオヤー";

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    string name = map[15937];

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.erase(10583);
    ```

=== "Java"

    ```java title="hash_map.java"
    /* ハッシュテーブルを初期化 */
    Map<Integer, String> map = new HashMap<>();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.put(12836, "シャオハ");
    map.put(15937, "シャオルオ");
    map.put(16750, "シャオスワン");
    map.put(13276, "シャオファ");
    map.put(10583, "シャオヤー");

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    String name = map.get(15937);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(10583);
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* ハッシュテーブルを初期化 */
    Dictionary<int, string> map = new() {
        /* 追加操作 */
        // ハッシュテーブルにキーと値のペア (key, value) を追加
        { 12836, "シャオハ" },
        { 15937, "シャオルオ" },
        { 16750, "シャオスワン" },
        { 13276, "シャオファ" },
        { 10583, "シャオヤー" }
    };

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    string name = map[15937];

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.Remove(10583);
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* ハッシュテーブルを初期化 */
    hmap := make(map[int]string)

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    hmap[12836] = "シャオハ"
    hmap[15937] = "シャオルオ"
    hmap[16750] = "シャオスワン"
    hmap[13276] = "シャオファ"
    hmap[10583] = "シャオヤー"

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    name := hmap[15937]

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    delete(hmap, 10583)
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* ハッシュテーブルを初期化 */
    var map: [Int: String] = [:]

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map[12836] = "シャオハ"
    map[15937] = "シャオルオ"
    map[16750] = "シャオスワン"
    map[13276] = "シャオファ"
    map[10583] = "シャオヤー"

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    let name = map[15937]!

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.removeValue(forKey: 10583)
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* ハッシュテーブルを初期化 */
    const map = new Map();
    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.set(12836, 'シャオハ');
    map.set(15937, 'シャオルオ');
    map.set(16750, 'シャオスワン');
    map.set(13276, 'シャオファ');
    map.set(10583, 'シャオヤー');

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    let name = map.get(15937);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.delete(10583);
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* ハッシュテーブルを初期化 */
    const map = new Map<number, string>();
    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.set(12836, 'シャオハ');
    map.set(15937, 'シャオルオ');
    map.set(16750, 'シャオスワン');
    map.set(13276, 'シャオファ');
    map.set(10583, 'シャオヤー');
    console.info('\n追加後のハッシュテーブルは次のとおりです\nKey -> Value');
    console.info(map);

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    let name = map.get(15937);
    console.info('\n学籍番号 15937 を入力し、名前を検索: ' + name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.delete(10583);
    console.info('\n10583 を削除した後のハッシュテーブル\nKey -> Value');
    console.info(map);
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* ハッシュテーブルを初期化 */
    Map<int, String> map = {};

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map[12836] = "シャオハ";
    map[15937] = "シャオルオ";
    map[16750] = "シャオスワン";
    map[13276] = "シャオファ";
    map[10583] = "シャオヤー";

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    String name = map[15937];

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(10583);
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    use std::collections::HashMap;

    /* ハッシュテーブルを初期化 */
    let mut map: HashMap<i32, String> = HashMap::new();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map.insert(12836, "シャオハ".to_string());
    map.insert(15937, "シャオルオ".to_string());
    map.insert(16750, "シャオスワン".to_string());
    map.insert(13279, "シャオファ".to_string());
    map.insert(10583, "シャオヤー".to_string());

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    let _name: Option<&String> = map.get(&15937);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    let _removed_value: Option<String> = map.remove(&10583);
    ```

=== "C"

    ```c title="hash_map.c"
    // C には組み込みのハッシュテーブルはありません
    ```

=== "Kotlin"

    ```kotlin title="hash_map.kt"
    /* ハッシュテーブルを初期化 */
    val map = HashMap<Int,String>()

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    map[12836] = "シャオハ"
    map[15937] = "シャオルオ"
    map[16750] = "シャオスワン"
    map[13276] = "シャオファ"
    map[10583] = "シャオヤー"

    /* 検索操作 */
    // ハッシュテーブルにキー key を入力し、値 value を取得
    val name = map[15937]

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    map.remove(10583)
    ```

=== "Ruby"

    ```ruby title="hash_map.rb"
    # ハッシュテーブルを初期化
    hmap = {}

    # 追加操作
    # ハッシュテーブルにキーと値のペア (key, value) を追加
    hmap[12836] = "シャオハ"
    hmap[15937] = "シャオルオ"
    hmap[16750] = "シャオスワン"
    hmap[13276] = "シャオファ"
    hmap[10583] = "シャオヤー"

    # 検索操作
    # ハッシュテーブルにキー key を入力し、値 value を取得
    name = hmap[15937]

    # 削除操作
    # ハッシュテーブルからキーと値のペア (key, value) を削除
    hmap.delete(10583)
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%90%91%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E8%BE%93%E5%85%A5%E9%94%AE%20key%20%EF%BC%8C%E5%BE%97%E5%88%B0%E5%80%BC%20value%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E5%88%A0%E9%99%A4%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

ハッシュテーブルには、キーと値のペア、キー、値を走査する 3 つの一般的な方法があります。コード例は以下のとおりです：

=== "Python"

    ```python title="hash_map.py"
    # ハッシュテーブルを走査
    # キーと値のペア key->value を走査
    for key, value in hmap.items():
        print(key, "->", value)
    # キー key のみを走査
    for key in hmap.keys():
        print(key)
    # 値 value のみを走査
    for value in hmap.values():
        print(value)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* ハッシュテーブルを走査 */
    // キーと値のペア key->value を走査
    for (auto kv: map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    // イテレータを使って key->value を走査
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }
    ```

=== "Java"

    ```java title="hash_map.java"
    /* ハッシュテーブルを走査 */
    // キーと値のペア key->value を走査
    for (Map.Entry <Integer, String> kv: map.entrySet()) {
        System.out.println(kv.getKey() + " -> " + kv.getValue());
    }
    // キー key のみを走査
    for (int key: map.keySet()) {
        System.out.println(key);
    }
    // 値 value のみを走査
    for (String val: map.values()) {
        System.out.println(val);
    }
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* ハッシュテーブルを走査 */
    // キーと値のペア Key->Value を走査
    foreach (var kv in map) {
        Console.WriteLine(kv.Key + " -> " + kv.Value);
    }
    // キー key のみを走査
    foreach (int key in map.Keys) {
        Console.WriteLine(key);
    }
    // 値 value のみを走査
    foreach (string val in map.Values) {
        Console.WriteLine(val);
    }
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* ハッシュテーブルを走査 */
    // キーと値のペア key->value を走査
    for key, value := range hmap {
        fmt.Println(key, "->", value)
    }
    // キー key のみを走査
    for key := range hmap {
        fmt.Println(key)
    }
    // 値 value のみを走査
    for _, value := range hmap {
        fmt.Println(value)
    }
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* ハッシュテーブルを走査 */
    // キーと値のペア Key->Value を走査
    for (key, value) in map {
        print("\(key) -> \(value)")
    }
    // キー Key のみを走査
    for key in map.keys {
        print(key)
    }
    // 値 Value のみを走査
    for value in map.values {
        print(value)
    }
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* ハッシュテーブルを走査 */
    console.info('\nキーと値のペア Key->Value を走査');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\nキー Key のみを走査');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n値 Value のみを走査');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* ハッシュテーブルを走査 */
    console.info('\nキーと値のペア Key->Value を走査');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\nキー Key のみを走査');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n値 Value のみを走査');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* ハッシュテーブルを走査 */
    // キーと値のペア Key->Value を走査
    map.forEach((key, value) {
      print('$key -> $value');
    });

    // キー Key のみを走査
    map.keys.forEach((key) {
      print(key);
    });

    // 値 Value のみを走査
    map.values.forEach((value) {
      print(value);
    });
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    /* ハッシュテーブルを走査 */
    // キーと値のペア Key->Value を走査
    for (key, value) in &map {
        println!("{key} -> {value}");
    }

    // キー Key のみを走査
    for key in map.keys() {
        println!("{key}");
    }

    // 値 Value のみを走査
    for value in map.values() {
        println!("{value}");
    }
    ```

=== "C"

    ```c title="hash_map.c"
    // C には組み込みのハッシュテーブルはありません
    ```

=== "Kotlin"

    ```kotlin title="hash_map.kt"
    /* ハッシュテーブルを走査 */
    // キーと値のペア key->value を走査
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // キー key のみを走査
    for (key in map.keys) {
        println(key)
    }
    // 値 value のみを走査
    for (_val in map.values) {
        println(_val)
    }
    ```

=== "Ruby"

    ```ruby title="hash_map.rb"
    # ハッシュテーブルを走査
    # キーと値のペア key->value を走査
    hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

    # キー key のみを走査
    hmap.keys.each { |key| puts key }

    # 値 value のみを走査
    hmap.values.each { |val| puts val }
    ```

??? pythontutor "可視化実行"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%E6%B7%BB%E5%8A%A0%E6%93%8D%E4%BD%9C%0A%20%20%20%20%23%20%E5%9C%A8%E5%93%88%E5%B8%8C%E8%A1%A8%E4%B8%AD%E6%B7%BB%E5%8A%A0%E9%94%AE%E5%80%BC%E5%AF%B9%20%28key,%20value%29%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E5%93%88%E5%B8%8C%E8%A1%A8%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E9%94%AE%E5%80%BC%E5%AF%B9%20key-%3Evalue%0A%20%20%20%20for%20key,%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key,%20%22-%3E%22,%20value%29%0A%20%20%20%20%23%20%E5%8D%95%E7%8B%AC%E9%81%8D%E5%8E%86%E9%94%AE%20key%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%E5%8D%95%E7%8B%AC%E9%81%8D%E5%8E%86%E5%80%BC%20value%0A%20%20%20%20for%20value%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28value%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## ハッシュテーブルの簡単な実装

まずは最も単純なケースとして、**1 つの配列だけでハッシュテーブルを実装する**ことを考えます。ハッシュテーブルでは、配列中の各空き位置を<u>バケット（bucket）</u>と呼び、各バケットには 1 つのキーと値のペアを格納できます。したがって、検索操作とは `key` に対応するバケットを見つけ、そのバケットから `value` を取得することです。

では、`key` に基づいて対応するバケットをどのように特定するのでしょうか。これは<u>ハッシュ関数（hash function）</u>によって実現されます。ハッシュ関数の役割は、大きな入力空間をより小さな出力空間に写像することです。ハッシュテーブルでは、入力空間はすべての `key` 、出力空間はすべてのバケット（配列インデックス）です。言い換えると、`key` を入力すると、**ハッシュ関数によってその `key` に対応するキーと値のペアの配列内での格納位置を求められます**。

`key` を入力したとき、ハッシュ関数の計算過程は次の 2 段階に分かれます。

1. あるハッシュアルゴリズム `hash()` を用いてハッシュ値を計算します。
2. ハッシュ値をバケット数（配列長）`capacity` で剰余し、その `key` に対応するバケット（配列インデックス）`index` を求めます。

```shell
index = hash(key) % capacity
```

その後、`index` を使ってハッシュテーブル内の対応するバケットにアクセスし、`value` を取得できます。

配列長を `capacity = 100` 、ハッシュアルゴリズムを `hash(key) = key` とすると、ハッシュ関数は `key % 100` となります。次の図では、`key` を学籍番号、`value` を名前の例として、ハッシュ関数の動作原理を示します。

![ハッシュ関数の動作原理](hash_map.assets/hash_function.png)

以下のコードは、単純なハッシュテーブルを実装したものです。ここでは、キーと値のペアを表すために `key` と `value` をクラス `Pair` にまとめています。

```src
[file]{array_hash_map}-[class]{array_hash_map}-[func]{}
```

## ハッシュ衝突と拡張

本質的には、ハッシュ関数の役割は、すべての `key` からなる入力空間を、配列のすべてのインデックスからなる出力空間に写像することです。しかし、入力空間は多くの場合、出力空間よりはるかに大きいため、**理論上は必ず「複数の入力が同じ出力に対応する」状況が存在します**。

上の例のハッシュ関数では、入力 `key` の下 2 桁が同じであれば、出力結果も同じになります。たとえば、学籍番号 12836 と 20336 の 2 人の学生を検索すると、次の結果を得ます：

```shell
12836 % 100 = 36
20336 % 100 = 36
```

次の図に示すように、2 つの学籍番号が同じ名前を指してしまっており、これは明らかに誤りです。このような、複数の入力が同じ出力に対応する状況を<u>ハッシュ衝突（hash collision）</u>と呼びます。

![ハッシュ衝突の例](hash_map.assets/hash_collision.png)

容易に分かるように、ハッシュテーブルの容量 $n$ が大きいほど、複数の `key` が同じバケットに割り当てられる確率は低くなり、衝突も少なくなります。したがって、**ハッシュテーブルを拡張することでハッシュ衝突を減らせます**。

次の図に示すように、拡張前はキーと値のペア `(136, A)` と `(236, D)` が衝突していますが、拡張後は衝突が解消されます。

![ハッシュテーブルの拡張](hash_map.assets/hash_table_reshash.png)

配列の拡張と同様に、ハッシュテーブルの拡張ではすべてのキーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移し替える必要があり、非常に時間がかかります。また、ハッシュテーブルの容量 `capacity` が変わるため、ハッシュ関数を使ってすべてのキーと値のペアの格納位置を再計算しなければならず、これによって拡張過程の計算コストがさらに増加します。そのため、プログラミング言語では通常、頻繁な拡張を防ぐために十分大きなハッシュテーブル容量をあらかじめ確保します。

<u>負荷率（load factor）</u>はハッシュテーブルにおける重要な概念であり、ハッシュテーブル内の要素数をバケット数で割ったものとして定義され、ハッシュ衝突の深刻さを測るために用いられます。**また、ハッシュテーブル拡張の発動条件としてもよく使われます**。例えば Java では、負荷率が $0.75$ を超えると、システムはハッシュテーブルを元の $2$ 倍に拡張します。
