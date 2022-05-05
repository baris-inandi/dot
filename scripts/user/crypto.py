from os import system, path, remove
from pickle import FALSE
import grequests
import time
import json

CACHE_FILE = path.join(path.expanduser("~"), ".cache/.cryptopy_cache.json")
LOCKFILE = path.join(path.expanduser("~"), ".cache/.cryptopy_lock")
MSG_WIDTH = 36
UP_SYMBOL = "🟢"
DOWN_SYMBOL = "🔴"

with open(path.join(path.expanduser("~"), "dot/config/cryptopy.json")) as f:
    j = json.load(f)
    CONF_STR = str(j)
    TICKERS = j["tickers"]
    TIME = j["timeout"] * 1000
    CACHE_TIMEOUT = j["cache"] * 60


def trailing_round(num: float, precision: int) -> str:
    return f"%.{precision}f" % round(num, precision)


def pad_str(length: int, l: str, r: str):
    return l + str(" " * int(length - len(l) - len(r))) + r


def is_cached() -> bool:
    try:
        with open(CACHE_FILE) as f:
            j = json.load(f)
            return (
                j["timestamp"] + CACHE_TIMEOUT > round(time.time())
                and CONF_STR == j["conf"]
            )
    except:
        return False


def fetch() -> dict[str, dict[str, str]]:
    urls = [
        f"https://api.kucoin.com/api/v1/market/stats?symbol={t}-USDT" for t in TICKERS
    ]
    rs = (grequests.get(u) for u in urls)
    api_outs_list = grequests.map(rs)
    out = {
        TICKERS[index]: out.json()["data"] for index, out in enumerate(api_outs_list)
    }
    return out


def main():
    try:
        if path.isfile(LOCKFILE):
            return
        open(LOCKFILE, "w")
        cumulative_time = 0
        if is_cached():
            with open(CACHE_FILE, "r") as f:
                out = json.load(f)["cache"]
        else:
            out = fetch()
            with open(CACHE_FILE, "w") as f:
                json.dump(
                    {"timestamp": round(time.time()), "conf": CONF_STR, "cache": out}, f
                )
        for k, v in out.items():
            start = time.time()
            k = k.upper()

            price = float(v["buy"])
            changeRate = float(v["changeRate"])
            changeRateStr = trailing_round(changeRate, 2)
            changePrice = float(v["changePrice"])
            avgPrice = float(v["averagePrice"])
            aboveAvg = price > avgPrice

            if price > 1000:
                price = round(float(v["buy"]))
                changePriceStr = str(round(changePrice))
                avgPriceStr = str(round(avgPrice))
            elif price > 100:
                price = trailing_round(float(v["buy"]), 1)
                changePriceStr = trailing_round(changePrice, 1)
                avgPriceStr = trailing_round(avgPrice, 1)
            elif price > 10:
                price = trailing_round(float(v["buy"]), 2)
                changePriceStr = trailing_round(changePrice, 2)
                avgPriceStr = trailing_round(avgPrice, 2)
            else:
                price = trailing_round(float(v["buy"]), 3)
                changePriceStr = trailing_round(changePrice, 3)
                avgPriceStr = trailing_round(avgPrice, 3)

            if changePrice < 0:
                changePriceStr = f"\\{changePriceStr}"

            up_down = (
                "Short " + DOWN_SYMBOL if changePrice < 0 else "Long " + UP_SYMBOL
            ) + " "
            msg_header = f"{k} | {price} USD"
            msg_header = pad_str(MSG_WIDTH, msg_header, up_down)
            msg_fmt = pad_str(MSG_WIDTH, f"{changePriceStr} USD", f"{changeRateStr}%")
            msg_fmt += "\n" + pad_str(
                MSG_WIDTH,
                f"{avgPriceStr} USD avg.",
                "Above avg." if aboveAvg else "Below avg.",
            )
            system(
                f'notify-send "{msg_header}" "{msg_fmt}" -t {str(TIME - cumulative_time)}'
            )
            end = time.time()
            elapsed = round((end - start) * 1000) + 2
            cumulative_time += elapsed
    finally:
        remove(LOCKFILE)


if __name__ == "__main__":
    main()
