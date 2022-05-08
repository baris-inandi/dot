"""
    A script that divides input to 1**18 for easy wei to eth conversion.
"""

import clipboard
from sys import argv


def main():
    try:
        if len(argv) > 1:
            num = argv[1]
            print(int(num) / 10**18)
        else:
            num = clipboard.paste()
            print(int(num) / 10**18)
    except Exception as e:
        print(f'Wei: Cannot parse input:\n"{num}"')
        print("1 ETH = 1000000000000000000 wei")


if __name__ == "__main__":
    main()
