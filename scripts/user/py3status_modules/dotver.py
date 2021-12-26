import subprocess
from os import chdir
from os.path import expanduser


def cmd(c: list):
    result = subprocess.run(c, stdout=subprocess.PIPE)
    return result.stdout.decode("utf-8").strip()


def get_ver():
    home = expanduser("~")
    chdir(home + "/dot")
    return cmd(["git", "rev-parse", "--short", "--verify", "HEAD"])


print(get_ver())


class Py3status:
    def main(self):
        return {
            'cached_until': 5,
            'full_text': f"[running dot {get_ver()}]",
            'cached_until': self.py3.CACHE_FOREVER
        }
