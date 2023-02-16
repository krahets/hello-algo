"""
File: build_markdown_docs.py
Created Time: 2023-02-06
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.dirname(osp.abspath(__file__)))))

import re
import glob
import shutil
from docs.utils.number_headings import number_headings
from docs.utils.extract_code_python import ExtractCodeBlocksPython
from docs.utils.extract_code_java import ExtractCodeBlocksJava
from docs.utils.extract_code_cpp import ExtractCodeBlocksCpp
from docs.utils.extract_code_jsts import ExtractCodeBlocksJSTS
from docs.utils.extract_code_swift import ExtractCodeBlocksSwift
from docs.utils.extract_code_csharp import ExtractCodeBlocksCSharp
from docs.utils.extract_code_go import ExtractCodeBlocksGo
from docs.utils.extract_code_zig import ExtractCodeBlocksZig


def build_code_blocks(md_path):
    with open(md_path, "r") as f:
        lines = f.readlines()
    
    code_blocks_dict = {}
    file_pattern = re.compile(r'\s*```(\w+)\s+title="(.+)"')
    src_pattern = re.compile(r'\s*\[class\]\{(.*?)\}-\[func\]\{(.*?)\}')
    
    i = 0
    while i < len(lines):
        # Find the line target to the source codes
        src_match = src_pattern.match(lines[i])
        if src_match is None:
            i += 1
            continue
        for j in range(i - 1, -1 ,-1):
            file_match = file_pattern.match(lines[j])
            if file_match is not None:
                break
        # Get the coresponding language code extractor
        lang = file_match[1]
        file_name = file_match[2]
        
        if lang not in extractor_dict:
            print(f"warning: {lang} is not in the extractor_dict")
            i += 1
            continue
        
        extractor = extractor_dict[lang]
        # Get code blocks
        if file_name not in code_blocks_dict:
            code_blocks = extractor.extract(
                file_path=osp.dirname(md_path).replace("docs/", f"codes/{lang}/") + f"/{file_name}")
            if code_blocks is None:
                i += 1
                continue
            code_blocks_dict[file_name] = code_blocks

        header_line = i
        class_label = src_match[1]
        func_label = src_match[2]
        code_blocks = code_blocks_dict[file_name]

        # Add the class to the doc
        if not func_label and class_label:
            if class_label in code_blocks["classes"]:
                lines.pop(header_line)
                class_block = code_blocks["classes"][class_label]["block"]
                for code_line in class_block[::-1]:
                    ind = " " * 4 if code_line != "\n" else ""
                    lines.insert(header_line, ind + code_line)
        # Add the function to the doc
        elif func_label and not class_label:
            if func_label in code_blocks["funcs"]:
                lines.pop(header_line)
                func_block = code_blocks["funcs"][func_label]
                for code_line in func_block["block"][::-1]:
                    ind = " " * 4 if code_line != "\n" else ""
                    lines.insert(header_line, ind + code_line)
        # Add the class method to the doc
        elif func_label and class_label:
            if class_label in code_blocks["classes"]:
                class_dict = code_blocks["classes"][class_label]
                if func_label in class_dict["funcs"]:
                    lines.pop(header_line)
                    func_block = class_dict["funcs"][func_label]
                    for code_line in func_block["block"][::-1]:
                        lines.insert(header_line, code_line)
        
        i += 1
                    
    with open(md_path.replace("docs/", "build/"), "w") as f:
        f.writelines(lines)
        print(f"Built {md_path}")


extractor_dict = {
    "java": ExtractCodeBlocksJava(),
    "python": ExtractCodeBlocksPython(),
    "cpp": ExtractCodeBlocksCpp(),
    "go": ExtractCodeBlocksGo(),
    "javascript": ExtractCodeBlocksJSTS(),
    "typescript": ExtractCodeBlocksJSTS(),
    "swift": ExtractCodeBlocksSwift(),
    "csharp": ExtractCodeBlocksCSharp(),
    "zig": ExtractCodeBlocksZig(),
}


if __name__ == "__main__":
    # Copy files to the build dir
    shutil.copytree("docs", "build", dirs_exist_ok=True)
    shutil.rmtree("build/utils")
    
    # Build code blocks
    for md_path in glob.glob("docs/chapter_*/*.md"):
        build_code_blocks(md_path)

    # Build headings
    number_headings("mkdocs.yml", "build")
