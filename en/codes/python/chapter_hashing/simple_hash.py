"""
File: simple_hash.py
Created Time: 2023-06-15
Author: krahets (krahets@163.com)
"""


def add_hash(key: str) -> int:
    """Additive hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash += ord(c)
    return hash % modulus


def mul_hash(key: str) -> int:
    """Multiplicative hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = 31 * hash + ord(c)
    return hash % modulus


def xor_hash(key: str) -> int:
    """XOR hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash ^= ord(c)
    return hash % modulus


def rot_hash(key: str) -> int:
    """Rotational hash"""
    hash = 0
    modulus = 1000000007
    for c in key:
        hash = (hash << 4) ^ (hash >> 28) ^ ord(c)
    return hash % modulus


"""Driver Code"""
if __name__ == "__main__":
    key = "Hello algorithm"

    hash = add_hash(key)
    print(f"Additive hash value is {hash}")

    hash = mul_hash(key)
    print(f"Multiplicative hash value is {hash}")

    hash = xor_hash(key)
    print(f"XOR hash value is {hash}")

    hash = rot_hash(key)
    print(f"Rotational hash value is {hash}")
