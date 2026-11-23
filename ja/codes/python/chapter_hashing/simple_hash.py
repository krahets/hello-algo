"""
File: simple_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""


def add_hash(key: str) -> int:
    """加算ハッシュ"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash += ord(c)
    return hash % modulus


def mul_hash(key: str) -> int:
    """乗算ハッシュ"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = 31 * hash + ord(c)
    return hash % modulus


def xor_hash(key: str) -> int:
    """排他的論理和ハッシュ"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash ^= ord(c)
    return hash % modulus


def rot_hash(key: str) -> int:
    """回転ハッシュ"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
    return hash % modulus


"""実行用コード"""
if __name__ == "__main__":
    key = "Hello 算法"

    hash = add_hash(key)
    print(f"加算ハッシュの値は {hash}")

    hash = mul_hash(key)
    print(f"乗算ハッシュの値は {hash}")

    hash = xor_hash(key)
    print(f"排他的論理和ハッシュの値は {hash}")

    hash = rot_hash(key)
    print(f"回転ハッシュの値は {hash}")
