from sys import argv
from os import system


def main():
    from_ = argv[1]
    to_ = argv[2]
    args = " ".join(argv[3:])
    system(f"trans -indent 2 -s {from_} -t {to_} {args}")


if __name__ == "__main__":
    main()
