/**
 * File: simple_hash.dart
 * Created Time: 2023-06-25
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 加法雜湊 */
int addHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* 乘法雜湊 */
int mulHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash = (31 * hash + key.codeUnitAt(i)) % MODULUS;
  }
  return hash;
}

/* 互斥或雜湊 */
int xorHash(String key) {
  int hash = 0;
  final int MODULUS = 1000000007;
  for (int i = 0; i < key.length; i++) {
    hash ^= key.codeUnitAt(i);
  }
  return hash & MODULUS;
}

/* 旋轉雜湊 */
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
  String key = "Hello 演算法";

  int hash = addHash(key);
  print("加法雜湊值為 $hash");

  hash = mulHash(key);
  print("乘法雜湊值為 $hash");

  hash = xorHash(key);
  print("互斥或雜湊值為 $hash");

  hash = rotHash(key);
  print("旋轉雜湊值為 $hash");
}
