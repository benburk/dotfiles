import os


def main():
    print("hi")
    path = "/Users/benburk/Dropbox/reference"

    for root, dirs, files in os.walk(path, False):
        for directory in dirs:
            print(f"{root}: {directory} -> z{directory.lower()}")
            os.rename(f"{root}/{directory}", f"{root}/z{directory.lower()}")

    input(">")
    for root, dirs, files in os.walk(path, False):
        for directory in dirs:
            print(f"{root}: {directory} -> {directory[1:]}")
            os.rename(f"{root}/{directory}", f"{root}/{directory[1:]}")


if __name__ == "__main__":
    main()
