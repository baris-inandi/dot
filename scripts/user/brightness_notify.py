import subprocess


def percentage(part, whole):
    return 20 * float(part) / float(whole)


def cmd(c: list):
    result = subprocess.run(c, stdout=subprocess.PIPE)
    return result.stdout.decode("utf-8").strip()


def main():
    current_brightness = (cmd(["brightnessctl", "g"]))
    max_brightness = (cmd(["brightnessctl", "m"]))
    notify = round(percentage(current_brightness, max_brightness))
    cmd(["notify-send", notify * "█", "-t", "250"])
    pass


if __name__ == '__main__':
    main()
