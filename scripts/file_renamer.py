"""
rename
"""
import os


def process(string: str) -> str:
    """stuff"""
    string = string.lower()
    string = string.replace(" ", "_")
    return string


def main():
    """rename files"""
    print("hi")
    path = "/Users/benburk/Desktop/root/courses"

    for root, dirs, files in os.walk(path, False):
        for file in files:
            if file.lower() != file and "DS_Store" not in file:
                print(root + "/" + file)
        # for directory in dirs:
        #     pathname = f"{root}/{directory}"
        #     modified = f"{root}/{process(directory)}"

        #     print(pathname + " -> " + modified)
        #     os.rename(pathname, modified)


if __name__ == "__main__":
    main()
