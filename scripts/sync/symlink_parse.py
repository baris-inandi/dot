from os import path


def main():
    with open(path.join(path.dirname(__file__), "../setup/symlink.sh")) as f:
        lines = f.readlines()

    parsed_lines = []
    for line in lines:
        if line.strip().startswith("ln"):
            parsed_lines.append(line.replace("\n", ""))

    print(' '.join(parsed_lines))


if __name__ == '__main__':
    main()
