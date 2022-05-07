"""
    A script that divides input to 1**18 for easy wei to eth conversion.
"""

import clipboard
import sys


def main():
    try:
        args = sys.argv[1:]
        if len(args) > 0:
            num = sys.argv[0]
            print(int(num) / 10**18)
        else:
            num = clipboard.paste()
            print(int(num) / 10**18)
    except Exception as e:
        print(f'Wei: Cannot parse input:\n"{num}"')


if __name__ == "__main__":
    main()
