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
from docs.utils.extract_code_python import ExtractCodeBlocksPython

def build_markdown(md_path):
    with open(md_path, "r") as f:
        lines = f.readlines()
    
    code_blocks_dict = {}
    file_pattern = re.compile(r'\s*```(\w+)\s+title="(.+)"')
    src_pattern = re.compile(r'\s*\[class\]\{(.*?)\}-\[func\]\{(.*?)\}')
    for i in range(len(lines)):
        # Find the line target to the source codes
        src_match = src_pattern.match(lines[i])
        if src_match is None:
            continue
        for j in range(i - 1, -1 ,-1):
            file_match = file_pattern.match(lines[j])
            if file_match is not None:
                break
        
        # Get code blocks
        lang = file_match[1]
        file_name = file_match[2]
        if file_name not in code_blocks_dict:
            code_blocks_dict[file_name] = ExtractCodeBlocksPython(
                file_path=osp.dirname(md_path).replace("docs/", f"codes/{lang}/") + f"/{file_name}")

        header_line = i
        class_label =  src_match[1]
        func_label = src_match[2]
        code_blocks = code_blocks_dict[file_name]
        src_info = {
            "line_number": i,
            "class_label": src_match[1],
            "func_label": src_match[2],
            "code_blocks": code_blocks_dict[file_name]
        }

        # Add the class to the doc
        if not func_label and class_label:
            if class_label in code_blocks.classes:
                lines.pop(header_line)
                class_block = code_blocks.classes[class_label]["block"]
                for code_line in class_block[::-1]:
                    ind = " " * 4 if code_line != "\n" else ""
                    lines.insert(header_line, ind + code_line)
        # Add the function to the doc
        elif func_label and not class_label:
            if func_label in code_blocks.functions:
                lines.pop(header_line)
                func_block = code_blocks.functions[func_label]
                for code_line in func_block["block"][::-1]:
                    ind = " " * 4 if code_line != "\n" else ""
                    lines.insert(header_line, ind + code_line)
        # Add the class method to the doc
        elif func_label and class_label:
            if class_label in code_blocks.classes:
                class_dict = code_blocks.classes[class_label]
                if func_label in class_dict["functions"]:
                    lines.pop(header_line)
                    func_block = class_dict["functions"][func_label]
                    for code_line in func_block["block"][::-1]:
                        lines.insert(header_line, code_line)
                    
    with open(md_path.replace("docs/", "build/"), "w") as f:
        f.writelines(lines)
        print(f"Built {md_path}")


if __name__ == "__main__":
    # Copy files to the build dir
    shutil.copytree("docs", "build", dirs_exist_ok=True)
    shutil.rmtree("build/utils")
    # Build docs
    for md_path in glob.glob("docs/chapter_*/*.md"):    
        build_markdown(md_path)
