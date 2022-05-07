"""
    A script that divides input to 1**18 for easy wei to eth conversion.
"""

import sys


def main():
    try:
        num = sys.argv[1]
        print(int(num) / 10**18)
    finally:
        pass


if __name__ == "__main__":
    main()
