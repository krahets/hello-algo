import os
import fnmatch
from typing import *

root_dir = os.getcwd()
docs_dir = root_dir + "/docs"
codes_dir = root_dir + "/codes"

def clean_md_files(docs_dir: str):
    for root, dirs, files in os.walk(docs_dir):
        for filename in fnmatch.filter(files, '*.md'):
            if "__cleaned" not in filename:  # skip cleaned md files
                clean_file(root, filename)
def clean_file(root: str, filename: str):
    source_file_path = os.path.join(root, filename)

    # cleaned file to be created in the same directory
    cleaned_filename = filename.split('.')[0] + "__cleaned.md"
    destination_file_path = os.path.join(root, cleaned_filename)

    # copy file to cleaned file
    # keep only Python or Java code.
    # append referenced source code, Python and Java, to the end of the cleaned file
    with open(source_file_path, 'r') as source_file, open(destination_file_path, 'w') as destination_file:
        code_files = []
        should_write = True
        for line in source_file:
            # add distinct source code file names to an array, later to append source code to the end of the cleaned file.
            if "[file]{" in line:
                code_filename = line.split("{")[1].split("}")[0]
                if code_filename not in code_files:
                    code_files.append(code_filename)

            # skip code other than Java and Python
            # '=== <num>' format is used to reference image, and should be kept too.
            if line.find("===") == 0 and "Python" not in line and "Java" not in line and "<" not in line:
                should_write = False

            # write to the cleaned file, also formatting code to make it more readable in md format.
            if should_write:
                if "```java" in line:
                    line = "```java\n"
                if "```python" in line:
                    line = "```python\n"
                if '=== "Java"' in line:
                    line = "Java\n"
                if '=== "Python"' in line:
                    line = "Python\n"
                if line.strip() == "```":
                    line = "```\n"
                destination_file.write(line)

            if line.strip() == "```":
                should_write = True
        append_code_files(code_files, destination_file)

def append_code_files(source_code_files: List[str], destination_file):
    destination_file.write("\n\n\n")
    destination_file.write("-----------------------------------------------------------------")
    destination_file.write("\n\n")

    for filename in source_code_files:
        destination_file.write(f"## {filename.upper()}\n")
        # Python
        python_filename = filename + ".py"
        python_file_path = get_file_path(python_filename, codes_dir)
        append_source_code(python_filename, python_file_path, destination_file, "Python")

        # Java
        java_filename = filename + ".java"
        java_file_path = get_file_path(java_filename, codes_dir)
        append_source_code(java_filename, java_file_path, destination_file, "Java")

        destination_file.write("\n\n\n")
        destination_file.write("-----------------------------------------------------------------")
        destination_file.write("\n\n")


def get_file_path(target_filename: str, search_path: str):
    for root, dirs, files in os.walk(search_path):
        if target_filename in files:
            return os.path.join(root, target_filename)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    return None

def append_source_code(filename: str, file_path: str, destination_file, language: str):
    destination_file.write(f"{language.capitalize()}: `{filename}`\n")
    destination_file.write(f"```{language.lower()}\n")

    with open(file_path, 'r') as source_code_file:
        skipped_lines = 0
        for line in source_code_file:
            skipped_lines += 1
            if skipped_lines < 6:
                continue
            destination_file.write(line)

    destination_file.write("```\n\n")


clean_md_files(docs_dir)