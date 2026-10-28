/**
 * File: built_in_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    int num = 3;
    size_t hashNum = hash<int>()(num);
    cout << "정수 " << num << " ; 해시값: " << hashNum << "\n";

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    cout << "불리언 값 " << bol << " ; 해시값: " << hashBol << "\n";

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    cout << "소수 " << dec << " ; 해시값: " << hashDec << "\n";

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    cout << "문자열 " << str << " ; 해시값: " << hashStr << "\n";

    // C++의 내장 std::hash()는 기본 데이터 타입에 대한 해시값 계산만 제공한다
    // 배열과 객체의 해시값 계산은 직접 구현해야 한다
}
