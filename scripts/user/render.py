import json
from os import path, system

RENDER_JSON = "~/dot/render/render.json"


class Display:
    def __init__(self, display: dict):
        self.output = display["output"]
        self.resolution = display["resolution"]
        try:
            self.rotation = display["rotation"]
        except Exception:
            self.rotation = "normal"
        try:
            self.primary = display["primary"]
        except Exception:
            self.primary = False
        self.fps = display["fps"]
        try:
            position = display["position"]
            if position["side"] and position["of"]:
                self.position = position
            else:
                self.position = None
        except Exception:
            self.position = None

    def generate_flags(self) -> str:
        # --output DP-4 --mode 3840x2160 --rate 119.88 --rotate normal
        pos = ""
        if self.position:
            pos = f" --{self.position['side']} {self.position['of']}"
        return f"--output {self.output} --mode {self.resolution} --rate {self.fps} --rotate {self.rotation}{pos} {'--primary' if self.primary else ''} "

    @staticmethod
    def cmd_from_display_list(l: list) -> str:
        out = ""
        for d in l:
            out += d.generate_flags()
        return "xrandr " + out


with open(path.expanduser(RENDER_JSON)) as f:
    data = json.load(f)

cmd = Display.cmd_from_display_list([Display(d) for d in data["displays"]])
print(cmd)
system(cmd)
