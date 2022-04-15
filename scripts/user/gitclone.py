from sys import argv
from os import system

if __name__ == "__main__":
    repo = argv[1]
    if "/" in repo:
        url = "https://github.com/" + repo
        dir = repo.split("/")[1]
    else:
        url = "https://github.com/baris-inandi/" + repo
        dir = repo
    system("git clone " + url)
