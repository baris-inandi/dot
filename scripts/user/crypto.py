from os import system, path, remove
import grequests
import time
import json

CACHE_FILE = path.join(path.expanduser("~"), ".cache/.cryptopy_cache.json")
LOCKFILE = path.join(path.expanduser("~"), ".cache/.cryptopy_lock")
MSG_WIDTH = 36
UP_SYMBOL = "🟢"
DOWN_SYMBOL = "🔴"

with open(path.join(path.expanduser("~"), "dot/config/cryptopy.json")) as f:
    CONF = json.load(f)
    TICKERS = CONF["tickers"]
    TIME = CONF["timeout"] * 1000
    CACHE_TIMEOUT = CONF["cache"] * 60


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
                and str(CONF["tickers"]) == j["conf"]
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
                    {
                        "timestamp": round(time.time()),
                        "conf": str(CONF["tickers"]),
                        "cache": out,
                    },
                    f,
                )
        for k, v in out.items():
            start = time.time()
            k = k.upper()

            price = float(v["buy"])
            change_rate = float(v["changeRate"])
            change_rate_str = trailing_round(change_rate, 2)
            change_price = float(v["changePrice"])
            avg_price = float(v["averagePrice"])
            above_avg = price > avg_price

            if price > 1000:
                price = round(float(v["buy"]))
                change_price_str = str(round(change_price))
                avg_price_str = str(round(avg_price))
            else:
                precision = 3
                if price > 100:
                    precision = 1
                elif price > 10:
                    precision = 2
                price = trailing_round(float(v["buy"]), precision)
                change_price_str = trailing_round(change_price, precision)
                avg_price_str = trailing_round(avg_price, precision)

            if change_price < 0:
                change_price_str = f"\\{change_price_str}"

            up_down = (
                "Short " + DOWN_SYMBOL if change_price < 0 else "Long " + UP_SYMBOL
            ) + " "
            msg_header = f"{k} | {price} USD"
            msg_header = pad_str(MSG_WIDTH, msg_header, up_down)
            msg_fmt = pad_str(
                MSG_WIDTH, f"{change_price_str} USD", f"{change_rate_str}%"
            )
            msg_fmt += "\n" + pad_str(
                MSG_WIDTH,
                f"{avg_price_str} USD avg.",
                "Above avg." if above_avg else "Below avg.",
            )
            system(
                f'notify-send "{msg_header}" "{msg_fmt}" -t {str(TIME - cumulative_time)}'
            )
            end = time.time()
            elapsed = round((end - start) * 1000) + 7
            cumulative_time += elapsed
    finally:
        remove(LOCKFILE)


if __name__ == "__main__":
    main()
