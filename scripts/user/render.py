import json
from os import path, system
from sys import argv

RENDER_JSON = "~/dot/render/render.json"


class Displays:
    def __init__(self, pragma_path):
        with open(path.expanduser(pragma_path)) as f:
            data = json.load(f)
        self.inner = [self.Display(d) for d in data["displays"]]
        self.scale = data["scale"]

    def exec(self):
        self.apply_scale()
        if "--scale-only" in argv:
            return
        cmd = ""
        for d in self.inner:
            cmd += d.generate_flags()
        cmd = "xrandr " + cmd
        print(cmd)
        system(cmd)
        if not "--nocomp" in argv:
            system("picom --experimental-backends --config ~/dot/config/picom.conf -b")

    def apply_scale(self):
        xresources = path.expanduser("~/dot/config/.Xresources.template")
        alacritty_scale = path.expanduser("~/dot/config/alacritty-scale.template.yml")
        with open(xresources) as f:
            xresources_content = f.read()
        with open(alacritty_scale) as f:
            alacritty_scale_content = f.read()
        xresources_content = xresources_content.replace(
            "$1", str(int(self.scale * 100))
        )
        alacritty_scale_content = alacritty_scale_content.replace("$1", str(self.scale))
        with open(path.expanduser("~/.Xresources"), "w+") as f:
            f.write(xresources_content)
        with open(path.expanduser("~/.config/alacritty/scale.yml"), "w+") as f:
            f.write(alacritty_scale_content)

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
                self.posxy = display["posxy"]
            except Exception:
                self.posxy = None
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
            pos, posxy = "", ""
            if self.position:
                pos = f" --{self.position['side']} {self.position['of']}"
            if self.posxy:
                posxy = f"--pos {self.posxy}"
            return f"--output {self.output} --mode {self.resolution} --rate {self.fps} --rotate {self.rotation}{pos} {'--primary' if self.primary else ''} {posxy}"


try:
    d = Displays(RENDER_JSON)
    d.exec()
except Exception as e:
    print(e)
    system("xrandr --auto")
