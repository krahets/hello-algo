/**
 * File: simple_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 加算ハッシュ */
int addHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* 乗算ハッシュ */
int mulHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* XOR ハッシュ */
int xorHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash ^= key.codeUnitAt(i);
  }
  return hash & MODULUS;
}

/* 回転ハッシュ */
int rotHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = ((hash << 4) ^ (hash >> 28) ^ key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* Dirver Code */
void main() {
  String key = "Hello アルゴリズム";

  int hash = addHash(key);
  print("加算ハッシュ値は $hash です");

  hash = mulHash(key);
  print("乗算ハッシュ値は $hash です");

  hash = xorHash(key);
  print("XOR ハッシュ値は $hash です");

  hash = rotHash(key);
  print("回転ハッシュ値は $hash です");
}
