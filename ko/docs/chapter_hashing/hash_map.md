# 해시 테이블

<u>해시 테이블(hash table)</u>은 <u>해시 표</u>라고도 하며, 키 `key`와 값 `value` 사이의 대응 관계를 만들어 원소를 효율적으로 조회한다. 구체적으로 키 `key`를 입력하면 해당 값 `value`를 $O(1)$ 시간에 얻을 수 있다.

아래 그림과 같이 학생 $n$명에게 각각 ‘이름’과 ‘학번’이라는 두 데이터가 있다고 하자. ‘학번을 입력하면 해당 이름을 반환하는’ 조회 기능을 구현하려면 그림의 해시 테이블을 사용할 수 있다.

![해시 테이블의 추상적 표현](hash_map.assets/hash_table_lookup.png)

해시 테이블 외에 배열과 연결 리스트로도 조회 기능을 구현할 수 있다. 효율 비교는 아래 표와 같다.

- **원소 추가**: 배열(연결 리스트)의 끝에 원소를 추가하면 되므로 $O(1)$ 시간이 걸린다.
- **원소 조회**: 배열(연결 리스트)이 정렬되어 있지 않으므로 모든 원소를 순회해야 하며 $O(n)$ 시간이 걸린다.
- **원소 삭제**: 먼저 원소를 찾은 뒤 배열(연결 리스트)에서 삭제해야 하므로 $O(n)$ 시간이 걸린다.

<p align="center"> 표 <id> &nbsp; 원소 조회 효율 비교 </p>

|          | 배열   | 연결 리스트   | 해시 테이블 |
| -------- | ------ | ------ | ------ |
| 원소 탐색 | $O(n)$ | $O(n)$ | $O(1)$ |
| 원소 추가 | $O(1)$ | $O(1)$ | $O(1)$ |
| 원소 삭제 | $O(n)$ | $O(n)$ | $O(1)$ |

이처럼 **해시 테이블에서는 삽입, 삭제, 탐색, 갱신의 시간 복잡도가 모두 $O(1)$**로 매우 효율적이다.

## 해시 테이블의 기본 연산

대표적인 연산에는 초기화, 조회, 키-값 쌍 추가와 삭제 등이 있다. 예제 코드는 다음과 같다.

=== "Python"

    ```python title="hash_map.py"
    # 해시 테이블 초기화
    hmap: dict = {}

    # 추가 연산
    # 해시 테이블에 키-값 쌍 (key, value) 추가
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"

    # 조회 연산
    # 해시 테이블에 키 key를 입력하여 값 value를 얻음
    name: str = hmap[15937]

    # 삭제 연산
    # 해시 테이블에서 키-값 쌍 (key, value) 삭제
    hmap.pop(10583)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* 해시 테이블 초기화 */
    unordered_map<int, string> map;

    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    string name = map[15937];

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.erase(10583);
    ```

=== "Java"

    ```java title="hash_map.java"
    /* 해시 테이블 초기화 */
    Map<Integer, String> map = new HashMap<>();

    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    String name = map.get(15937);

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(10583);
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* 해시 테이블 초기화 */
    Dictionary<int, string> map = new() {
        /* 추가 연산 */
        // 해시 테이블에 키-값 쌍 (key, value) 추가
        { 12836, "小哈" },
        { 15937, "小啰" },
        { 16750, "小算" },
        { 13276, "小法" },
        { 10583, "小鸭" }
    };

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    string name = map[15937];

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.Remove(10583);
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* 해시 테이블 초기화 */
    hmap := make(map[int]string)

    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    name := hmap[15937]

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    delete(hmap, 10583)
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* 해시 테이블 초기화 */
    var map: [Int: String] = [:]

    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    let name = map[15937]!

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.removeValue(forKey: 10583)
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* 해시 테이블 초기화 */
    const map = new Map();
    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    let name = map.get(15937);

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.delete(10583);
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* 해시 테이블 초기화 */
    const map = new Map<number, string>();
    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.set(12836, '小哈');
    map.set(15937, '小啰');
    map.set(16750, '小算');
    map.set(13276, '小法');
    map.set(10583, '小鸭');
    console.info('\n추가한 뒤의 해시 테이블\nKey -> Value');
    console.info(map);

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    let name = map.get(15937);
    console.info('\n학번 15937을 입력하여 찾은 이름 ' + name);

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.delete(10583);
    console.info('\n10583을 삭제한 뒤의 해시 테이블\nKey -> Value');
    console.info(map);
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* 해시 테이블 초기화 */
    Map<int, String> map = {};

    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    String name = map[15937];

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(10583);
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    use std::collections::HashMap;

    /* 해시 테이블 초기화 */
    let mut map: HashMap<i32, String> = HashMap::new();

    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map.insert(12836, "小哈".to_string());
    map.insert(15937, "小啰".to_string());
    map.insert(16750, "小算".to_string());
    map.insert(13279, "小法".to_string());
    map.insert(10583, "小鸭".to_string());

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    let _name: Option<&String> = map.get(&15937);

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    let _removed_value: Option<String> = map.remove(&10583);
    ```

=== "C"

    ```c title="hash_map.c"
    // C는 내장 해시 테이블을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="hash_map.kt"
    /* 해시 테이블 초기화 */
    val map = HashMap<Int,String>()

    /* 추가 연산 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    map[12836] = "小哈"
    map[15937] = "小啰"
    map[16750] = "小算"
    map[13276] = "小法"
    map[10583] = "小鸭"

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻음
    val name = map[15937]

    /* 삭제 연산 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    map.remove(10583)
    ```

=== "Ruby"

    ```ruby title="hash_map.rb"
    # 해시 테이블 초기화
    hmap = {}

    # 추가 연산
    # 해시 테이블에 키-값 쌍 (key, value) 추가
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"

    # 조회 연산
    # 해시 테이블에 키 key를 입력하여 값 value를 얻음
    name = hmap[15937]

    # 삭제 연산
    # 해시 테이블에서 키-값 쌍 (key, value) 삭제
    hmap.delete(10583)
    ```

??? pythontutor "코드 시각화"

    https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%A1%B0%ED%9A%8C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4%20key%EB%A5%BC%20%EC%9E%85%EB%A0%A5%ED%95%98%EC%97%AC%20%EA%B0%92%20value%EB%A5%BC%20%EC%96%BB%EC%9D%8C%0A%20%20%20%20name%20%3D%20hmap%5B15937%5D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%82%AD%EC%A0%9C%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%EC%84%9C%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%82%AD%EC%A0%9C%0A%20%20%20%20hmap.pop%2810583%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

해시 테이블을 순회하는 대표적인 방식은 키-값 쌍 순회, 키 순회, 값 순회의 세 가지다. 예제 코드는 다음과 같다.

=== "Python"

    ```python title="hash_map.py"
    # 해시 테이블 순회
    # 키-값 쌍 key->value 순회
    for key, value in hmap.items():
        print(key, "->", value)
    # 키 key만 순회
    for key in hmap.keys():
        print(key)
    # 값 value만 순회
    for value in hmap.values():
        print(value)
    ```

=== "C++"

    ```cpp title="hash_map.cpp"
    /* 해시 테이블 순회 */
    // 키-값 쌍 key->value 순회
    for (auto kv: map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    // 이터레이터로 key->value 순회
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }
    ```

=== "Java"

    ```java title="hash_map.java"
    /* 해시 테이블 순회 */
    // 키-값 쌍 key->value 순회
    for (Map.Entry <Integer, String> kv: map.entrySet()) {
        System.out.println(kv.getKey() + " -> " + kv.getValue());
    }
    // 키 key만 순회
    for (int key: map.keySet()) {
        System.out.println(key);
    }
    // 값 value만 순회
    for (String val: map.values()) {
        System.out.println(val);
    }
    ```

=== "C#"

    ```csharp title="hash_map.cs"
    /* 해시 테이블 순회 */
    // 키-값 쌍 Key->Value 순회
    foreach (var kv in map) {
        Console.WriteLine(kv.Key + " -> " + kv.Value);
    }
    // 키 key만 순회
    foreach (int key in map.Keys) {
        Console.WriteLine(key);
    }
    // 값 value만 순회
    foreach (string val in map.Values) {
        Console.WriteLine(val);
    }
    ```

=== "Go"

    ```go title="hash_map_test.go"
    /* 해시 테이블 순회 */
    // 키-값 쌍 key->value 순회
    for key, value := range hmap {
        fmt.Println(key, "->", value)
    }
    // 키 key만 순회
    for key := range hmap {
        fmt.Println(key)
    }
    // 값 value만 순회
    for _, value := range hmap {
        fmt.Println(value)
    }
    ```

=== "Swift"

    ```swift title="hash_map.swift"
    /* 해시 테이블 순회 */
    // 키-값 쌍 Key->Value 순회
    for (key, value) in map {
        print("\(key) -> \(value)")
    }
    // 키 Key만 순회
    for key in map.keys {
        print(key)
    }
    // 값 Value만 순회
    for value in map.values {
        print(value)
    }
    ```

=== "JS"

    ```javascript title="hash_map.js"
    /* 해시 테이블 순회 */
    console.info('\n키-값 쌍 Key->Value 순회');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\n키 Key만 순회');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n값 Value만 순회');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "TS"

    ```typescript title="hash_map.ts"
    /* 해시 테이블 순회 */
    console.info('\n키-값 쌍 Key->Value 순회');
    for (const [k, v] of map.entries()) {
        console.info(k + ' -> ' + v);
    }
    console.info('\n키 Key만 순회');
    for (const k of map.keys()) {
        console.info(k);
    }
    console.info('\n값 Value만 순회');
    for (const v of map.values()) {
        console.info(v);
    }
    ```

=== "Dart"

    ```dart title="hash_map.dart"
    /* 해시 테이블 순회 */
    // 키-값 쌍 Key->Value 순회
    map.forEach((key, value) {
      print('$key -> $value');
    });

    // 키 Key만 순회
    map.keys.forEach((key) {
      print(key);
    });

    // 값 Value만 순회
    map.values.forEach((value) {
      print(value);
    });
    ```

=== "Rust"

    ```rust title="hash_map.rs"
    /* 해시 테이블 순회 */
    // 키-값 쌍 Key->Value 순회
    for (key, value) in &map {
        println!("{key} -> {value}");
    }

    // 키 Key만 순회
    for key in map.keys() {
        println!("{key}");
    }

    // 값 Value만 순회
    for value in map.values() {
        println!("{value}");
    }
    ```

=== "C"

    ```c title="hash_map.c"
    // C는 내장 해시 테이블을 제공하지 않는다
    ```

=== "Kotlin"

    ```kotlin title="hash_map.kt"
    /* 해시 테이블 순회 */
    // 키-값 쌍 key->value 순회
    for ((key, value) in map) {
        println("$key -> $value")
    }
    // 키 key만 순회
    for (key in map.keys) {
        println(key)
    }
    // 값 value만 순회
    for (_val in map.values) {
        println(_val)
    }
    ```

=== "Ruby"

    ```ruby title="hash_map.rb"
    # 해시 테이블 순회
    # 키-값 쌍 key->value 순회
    hmap.entries.each { |key, value| puts "#{key} -> #{value}" }

    # 키 key만 순회
    hmap.keys.each { |key| puts key }

    # 값 value만 순회
    hmap.values.each { |val| puts val }
    ```

??? pythontutor "코드 시각화"

    https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20hmap%20%3D%20%7B%7D%0A%20%20%20%20%0A%20%20%20%20%23%20%EC%B6%94%EA%B0%80%20%EC%97%B0%EC%82%B0%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%EC%97%90%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20%28key%2C%20value%29%20%EC%B6%94%EA%B0%80%0A%20%20%20%20hmap%5B12836%5D%20%3D%20%22%E5%B0%8F%E5%93%88%22%0A%20%20%20%20hmap%5B15937%5D%20%3D%20%22%E5%B0%8F%E5%95%B0%22%0A%20%20%20%20hmap%5B16750%5D%20%3D%20%22%E5%B0%8F%E7%AE%97%22%0A%20%20%20%20hmap%5B13276%5D%20%3D%20%22%E5%B0%8F%E6%B3%95%22%0A%20%20%20%20hmap%5B10583%5D%20%3D%20%22%E5%B0%8F%E9%B8%AD%22%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%95%B4%EC%8B%9C%20%ED%85%8C%EC%9D%B4%EB%B8%94%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20%23%20%ED%82%A4-%EA%B0%92%20%EC%8C%8D%20key-%3Evalue%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key%2C%20value%20in%20hmap.items%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%2C%20%22-%3E%22%2C%20value%29%0A%20%20%20%20%23%20%ED%82%A4%20key%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20key%20in%20hmap.keys%28%29%3A%0A%20%20%20%20%20%20%20%20print%28key%29%0A%20%20%20%20%23%20%EA%B0%92%20value%EB%A7%8C%20%EC%88%9C%ED%9A%8C%0A%20%20%20%20for%20value%20in%20hmap.values%28%29%3A%0A%20%20%20%20%20%20%20%20print%28value%29&cumulative=false&curInstr=8&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 간단한 해시 테이블 구현

먼저 가장 간단한 경우로 **배열 하나만 사용하여 해시 테이블을 구현해 보자**. 해시 테이블에서는 배열의 각 자리를 <u>버킷(bucket)</u>이라고 하며, 버킷마다 키-값 쌍 하나를 저장할 수 있다. 따라서 조회 연산은 `key`에 해당하는 버킷을 찾고 그 안에서 `value`를 얻는 것이다.

그렇다면 `key`로 해당 버킷을 어떻게 찾을까? 이를 위해 <u>해시 함수(hash function)</u>를 사용한다. 해시 함수는 큰 입력 공간을 작은 출력 공간에 매핑한다. 해시 테이블에서 입력 공간은 모든 `key`이고, 출력 공간은 모든 버킷(배열 인덱스)이다. 즉, `key`를 입력하면 **해시 함수를 통해 그 키-값 쌍이 배열에 저장되는 위치를 얻을 수 있다**.

`key`를 입력했을 때 해시 함수의 계산 과정은 다음 두 단계로 나뉜다.

1. 어떤 해시 알고리즘 `hash()`로 해시값을 계산한다.
2. 해시값을 버킷 수(배열 길이) `capacity`로 나눈 나머지를 구하여 `key`에 해당하는 버킷(배열 인덱스) `index`를 얻는다.

```shell
index = hash(key) % capacity
```

그런 다음 `index`로 해시 테이블의 해당 버킷에 접근하여 `value`를 얻는다.

배열 길이가 `capacity = 100`이고 해시 알고리즘이 `hash(key) = key`이면, 해시 함수는 `key % 100`이다. 아래 그림은 학번을 `key`, 이름을 `value`로 삼아 해시 함수의 작동 원리를 보여 준다.

![해시 함수의 작동 원리](hash_map.assets/hash_function.png)

다음 코드는 간단한 해시 테이블을 구현한다. `key`와 `value`를 `Pair` 클래스로 묶어 키-값 쌍을 표현한다.

```src
[file]{array_hash_map}-[class]{array_hash_map}-[func]{}
```

## 해시 충돌과 용량 확장

해시 함수는 본질적으로 모든 `key`로 이루어진 입력 공간을 배열의 모든 인덱스로 이루어진 출력 공간에 매핑한다. 입력 공간은 대개 출력 공간보다 훨씬 크므로 **이론적으로 ‘여러 입력이 같은 출력에 대응하는’ 경우가 반드시 존재한다**.

앞의 해시 함수에서는 입력 `key`의 마지막 두 자리가 같으면 출력도 같다. 예를 들어 학번이 12836과 20336인 두 학생을 조회하면 다음과 같다.

```shell
12836 % 100 = 36
20336 % 100 = 36
```

아래 그림에서 두 학번이 같은 이름을 가리키는데, 이는 명백히 잘못되었다. 이처럼 여러 입력이 같은 출력에 대응하는 현상을 <u>해시 충돌(hash collision)</u>이라고 한다.

![해시 충돌의 예](hash_map.assets/hash_collision.png)

해시 테이블의 용량 $n$이 커질수록 여러 `key`가 같은 버킷에 들어갈 확률은 낮아지고 충돌도 줄어든다. 따라서 **해시 테이블의 용량을 늘려 해시 충돌을 줄일 수 있다**.

아래 그림에서 확장 전에는 키-값 쌍 `(136, A)`와 `(236, D)`가 충돌하지만 확장 후에는 충돌이 사라진다.

![해시 테이블의 용량 확장](hash_map.assets/hash_table_reshash.png)

배열 확장과 마찬가지로 해시 테이블을 확장하려면 모든 키-값 쌍을 기존 테이블에서 새 테이블로 옮겨야 하므로 시간이 많이 든다. 또한 용량 `capacity`가 바뀌므로 해시 함수로 모든 키-값 쌍의 저장 위치를 다시 계산해야 하며, 이는 확장 비용을 더욱 늘린다. 따라서 프로그래밍 언어는 보통 충분히 큰 용량을 미리 확보하여 잦은 확장을 방지한다.

<u>적재율(load factor)</u>은 해시 테이블의 원소 수를 버킷 수로 나눈 값으로, 해시 충돌의 심각도를 측정하는 중요한 개념이다. **용량 확장을 시작하는 조건으로도 자주 사용된다**. 예를 들어 Java에서는 적재율이 $0.75$를 넘으면 해시 테이블의 용량을 기존의 $2$배로 늘린다.
