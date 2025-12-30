# Hello Algorithm EPUB Converter

Convert [Hello Algorithm](https://github.com/krahets/hello-algo) Markdown documentation to EPUB e-books.

## Installation

```bash
npm install
```

## Usage

### Basic Usage

```bash
# Build Chinese version with C++ code (default)
npm run build

# Build with specific programming language
npm run build -- -l python

# Build Traditional Chinese version
npm run build -- -d zh-hant -l python -o hello-algo-zh-hant-python.epub

# Build English version
npm run build -- -d en -l python -o hello-algo-en-python.epub

# Build Japanese version
npm run build -- -d ja -l cpp -o hello-algo-ja-cpp.epub

# Build all combinations
npm run build -- --all --release-version 1.2.0
```

### Command Line Parameters

| Parameter | Short | Description | Default |
|-----------|-------|-------------|---------|
| `--doc-language` | `-d` | Document language (zh, zh-hant, en, ja) | `zh` |
| `--output` | `-o` | Output EPUB file path | `./hello-algo.epub` |
| `--language` | `-l` | Programming language | `cpp` |
| `--all` | `-a` | Build all combinations | - |
| `--release-version` | - | Version number for output filename | `1.0.0` |
| `--validate` | - | Enable content integrity validation | `false` |
| `--help` | `-h` | Show help | - |
| `--version` | `-V` | Show version | - |

### Supported Languages

**Document Languages:**
- `zh` - Simplified Chinese (all programming languages)
- `zh-hant` - Traditional Chinese (all programming languages)
- `en` - English (cpp, java, python only)
- `ja` - Japanese (cpp, java, python only)

**Programming Languages:**
- Supported by all document languages: `cpp`, `python`, `java`
- Supported by Chinese versions only: `csharp`, `go`, `swift`, `javascript`, `typescript`, `dart`, `rust`, `c`, `kotlin`, `ruby`, `zig`
