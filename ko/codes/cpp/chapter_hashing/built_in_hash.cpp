/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    // [region]{builtin_hash}
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "정수 " << num << " → 해시값: " << hashNum << "\n";
    // 정수 3 → 해시값: 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "불리언 값 " << bol << " → 해시값: " << hashBol << "\n";
    // 불리언 값 1 → 해시값: 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "소수 " << dec << " → 해시값: " << hashDec << "\n";
    // 소수 3.14159 → 해시값: 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "문자열 ‘" << str << "’ → 해시값: " << hashStr << "\n";
    // 문자열 ‘Hello 算法’ → 해시값: 15466937326284535026

    // C++의 내장 std::hash()는 기본 데이터 타입에 대한 해시값 계산만 제공한다
    // 배열과 객체의 해시값 계산은 직접 구현해야 한다
    // [endregion]{builtin_hash}
}
