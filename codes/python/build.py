import glob
import py_compile as pyc

if __name__ == "__main__":
    # find source code files
    src_paths = sorted(glob.glob("codes/python/**/*.py"))
    num_src = len(src_paths)
    num_src_error = 0

    # compile python code
    for src_path in src_paths:
        try:
            pyc.compile(src_path, doraise=True)
        except pyc.PyCompileError as e:
            num_src_error += 1
            print(e)

    print(f"===== Build Complete =====")
    print(f"Total: {num_src}")
    print(f"Error: {num_src_error}")
