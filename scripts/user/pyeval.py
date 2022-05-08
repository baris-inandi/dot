"""
    A script that quickly evaluates a line of python code for ease of use
"""

from sys import argv


def main():
    code = " ".join(argv[1:])
    print(eval(code))


if __name__ == "__main__":
    main()
