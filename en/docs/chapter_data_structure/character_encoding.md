---
comments: true
---

# 3.4 &nbsp; Character encoding *

All computer data is stored as binary numbers, including characters of type `char`. To represent characters, we need a character set that assigns each character a unique binary number. The computer can then convert numbers to characters by looking them up.

## 3.4.1 &nbsp; ASCII character set

<u>ASCII</u>, short for American Standard Code for Information Interchange, was the earliest character set. It uses 7 bits (the lower 7 bits of a byte) per character, allowing up to 128 characters. As shown in Figure 3-6, ASCII includes uppercase and lowercase English letters, digits 0 ~ 9, punctuation, and control characters such as newlines and tabs.

![ASCII codes](character_encoding.assets/ascii_table.png){ class="animation-figure" }

<p align="center"> Figure 3-6 &nbsp; ASCII codes </p>

However, **ASCII can represent only English text**. As computers spread worldwide, <u>EASCII</u> character sets emerged to support more languages. Extending ASCII from 7 bits to 8 allowed 256 distinct characters.

Different regions developed their own EASCII character sets. The first 128 characters remained identical to ASCII, while the remaining 128 varied to meet different languages' needs.

## 3.4.2 &nbsp; GBK character set

Eventually, **even EASCII proved too small for many languages**. Chinese, for example, has nearly 100,000 characters, with thousands used daily. In 1980, China's National Bureau of Standards released <u>GB2312</u>, containing 6,763 Chinese characters and meeting most basic needs for processing Chinese text.

GB2312 could not handle some rare and traditional characters. <u>GBK</u> extended it to 21,886 Chinese characters. In GBK encoding, ASCII characters use one byte, and Chinese characters use two.

## 3.4.3 &nbsp; Unicode character set

As computing grew, character sets and encoding standards proliferated, creating problems. Most covered only particular languages and did not work well in multilingual settings. Multiple standards also existed for the same language, so exchanging text between computers using different encodings could produce garbled text.

Researchers asked: **could a sufficiently comprehensive character set, containing all the world's languages and symbols, solve both multilingual compatibility and garbled-text problems**? This idea led to Unicode.

<u>Unicode</u>, whose Chinese name means "unified code", can theoretically accommodate over a million characters. It aims to bring the world's characters into one universal set for processing and displaying different languages, reducing garbled text caused by incompatible standards. Since its release in 1991, it has continued adding languages and characters. As of September 2022, Unicode contained 149,186 characters, including letters, symbols, and emoji.

As a universal character set, Unicode assigns each character a unique code point, or character number, from U+0000 to U+10FFFF. **It does not, by itself, specify how these code points are stored in a computer**. How can a system parse text containing code points of different lengths? For example, how does it distinguish one two-byte character from two one-byte characters?

**One straightforward solution is to store every character in a fixed-width encoding**. In Figure 3-7, each character in "Hello" occupies 1 byte, while each in "算法" occupies 2 bytes. Padding the high bits with zeros lets us encode every character in "Hello 算法" with 2 bytes. The system can then read one character every 2 bytes to recover the phrase.

![Example of Unicode encoding](character_encoding.assets/unicode_hello_algo.png){ class="animation-figure" }

<p align="center"> Figure 3-7 &nbsp; Example of Unicode encoding </p>

ASCII has already shown that English text needs only 1 byte per character. This scheme would double its storage compared with ASCII, wasting memory. We therefore need a more efficient Unicode encoding.

## 3.4.4 &nbsp; UTF-8 encoding

UTF-8 is now the most widely used Unicode encoding worldwide. **It is variable-length**, using 1 to 4 bytes per character depending on the character. ASCII characters need 1 byte, Latin and Greek letters need 2, common Chinese characters need 3, and some less common characters need 4.

UTF-8's rules have two cases.

- For a one-byte character, set the highest bit to $0$ and the remaining 7 bits to its Unicode code point. ASCII occupies the first 128 Unicode code points, so **UTF-8 is backward-compatible with ASCII**. UTF-8 can therefore decode old ASCII text.
- For an $n$-byte character, where $n > 1$, set the first byte's leading $n$ bits to $1$ and the next bit, $n + 1$, to $0$. Starting with the second byte, set the leading 2 bits of every byte to $10$. Fill the remaining bits with the character's Unicode code point.

Figure 3-8 shows UTF-8 for "Hello算法". Since the leading $n$ bits are $1$, the system can determine the character length $n$ by counting the leading $1$ bits.

Why do all remaining bytes begin with $10$? This $10$ acts as a check marker. If decoding starts at the wrong byte, the leading $10$ helps the system quickly detect the problem.

The prefix $10$ works as a marker because no character's first byte can begin with $10$ under UTF-8's rules. To see this by contradiction, suppose it did begin with $10$. The single leading one would imply a length of $1$ byte, corresponding to ASCII, but an ASCII byte must begin with $0$, a contradiction.

![Example of UTF-8 encoding](character_encoding.assets/utf-8_hello_algo.png){ class="animation-figure" }

<p align="center"> Figure 3-8 &nbsp; Example of UTF-8 encoding </p>

Two other common encodings are:

- **UTF-16**: Uses 2 or 4 bytes per character. ASCII and common non-English characters use 2 bytes; some characters require 4. For a two-byte character, its UTF-16 encoding equals its Unicode code point.
- **UTF-32**: Uses 4 bytes for every character. It therefore takes more space than UTF-8 or UTF-16, especially for text containing mostly ASCII characters.

In terms of storage, UTF-8 is efficient for English characters because each uses only 1 byte. UTF-16 is more efficient for some non-English characters, such as Chinese, using 2 bytes where UTF-8 may require 3.

In terms of compatibility, UTF-8 is the most widely supported, and many tools and libraries prioritize it.

## 3.4.5 &nbsp; Character encoding in programming languages

Historically, most programming languages have stored strings at runtime using fixed-width encodings such as UTF-16 or UTF-32. Fixed-width encoding lets us treat a string as an array, with the following advantages.

- **Random access**: UTF-16 strings support straightforward random access. With variable-length UTF-8, finding the $i$-th character requires traversing from the beginning to the $i$-th character, taking $O(n)$ time.
- **Character counting**: Similarly, finding the length of a UTF-16 string is an $O(1)$ operation, while finding the character count of a UTF-8 string requires traversing the whole string.
- **String operations**: Operations such as splitting, concatenation, insertion, and deletion are easier on UTF-16 strings. With UTF-8, they usually require extra work to avoid producing invalid encodings.

The design of string representations is an interesting subject involving many factors.

- Java's `String` uses UTF-16, with 2 bytes per character. When Java was designed, 16 bits were thought sufficient for every character. This turned out to be incorrect: Unicode later expanded beyond 16 bits, so a Java character may now require a pair of 16-bit values called a surrogate pair.
- JavaScript and TypeScript use UTF-16 for similar historical reasons. When Netscape introduced JavaScript in 1995, Unicode was still young, and 16 bits could represent all its characters at the time.
- C# uses UTF-16 largely because Microsoft designed .NET, and many Microsoft technologies, including Windows, use UTF-16 extensively.

Having underestimated the number of characters, these languages had to adopt surrogate pairs for Unicode characters beyond 16 bits. This was a compromise. A character in such a string may occupy 2 or 4 bytes, losing the benefit of fixed width, and handling surrogate pairs requires additional code, making programming and debugging more complex.

For these reasons, some languages use different representations.

- Python's `str` uses Unicode with a flexible representation whose character width depends on the largest code point in the string. If all characters are ASCII, each uses 1 byte. If some exceed ASCII but all lie within the Basic Multilingual Plane (BMP), each uses 2 bytes. If any lie outside the BMP, each uses 4 bytes.
- Go's `string` uses UTF-8 internally. Go also provides `rune` to represent a single Unicode code point.
- Rust's `str` and `String` use UTF-8 internally, while `char` represents a single Unicode code point.

These descriptions concern string storage within programming languages. **How strings are stored in files or transmitted over a network is a separate question**. For file storage and network transmission, strings are usually encoded as UTF-8 for compatibility and space efficiency.
