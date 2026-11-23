/**
 * File: simple_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 덧셈 해시 */
int addHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* 곱셈 해시 */
int mulHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* XOR 해시 */
int xorHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash ^= key.codeUnitAt(i);
  }
  return hash & MODULUS;
}

/* 회전 해시 */
int rotHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = ((hash << 4) ^ (hash >> 28) ^ key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* 실행 코드 */
void main() {
  String key = "Hello 算法";

  int hash = addHash(key);
  print("덧셈 해시값 = $hash");

  hash = mulHash(key);
  print("곱셈 해시값 = $hash");

  hash = xorHash(key);
  print("XOR 해시값 = $hash");

  hash = rotHash(key);
  print("회전 해시값 = $hash");
}
