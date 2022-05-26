'''
Check directory structure
convert flag to mp3
'''
import os
from pathlib import Path
import subprocess

song_regex = r"\d\d - \w+"

def main():
    path = Path("/Volumes/Library/Music/10 Best/3 Doors Down")



    for root, dirs, files in os.walk(path):

        for file in files:
            if file.endswith(".flac"):
                subprocess.run(["ffmpeg", "-i"])


    for item in path.iterdir():
        if item.is_dir():
            print(f"analyzing album: {item.name}")
            for song in item.iterdir():
                print(song)
        else:
            print("unexpected file")


    "ffmpeg -i {} -ab 320k {}.mp3"
    # for root, dirs, files in os.walk(path):
    #     print(files)


if __name__ == "__main__":
    main()