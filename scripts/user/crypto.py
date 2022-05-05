from os import system
from os import path
import grequests
import time
import json

CACHE_FILE = path.join("/tmp/", ".cryptopy_cache.json")

with open(path.join(path.expanduser("~"), "dot/config/cryptopy.json")) as f:
    j = json.load(f)
    CONF_STR = str(j)
    TICKERS = j["tickers"]
    TIME = j["timeout"] * 1000
    CACHE_TIMEOUT = j["cache"] * 60


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
    cumulative_time = 0
    if is_cached():
        with open(CACHE_FILE) as f:
            out = json.load(f)["cache"]
    else:
        out = fetch()
        with open(CACHE_FILE, "w+") as f:
            json.dump(
                {"timestamp": round(time.time()), "conf": CONF_STR, "cache": out}, f
            )
    for k, v in out.items():
        start = time.time()
        k = k.upper()
        changePrice = round(float(v["changePrice"]), 3)
        changeRate = round(float(v["changeRate"]), 3)
        averagePrice = round(float(v["averagePrice"]), 3)
        up_down = "🔴" if changePrice < 0 else "🟢"
        msg_fmt = f"{up_down} \${changePrice} ({changeRate}%)"
        system(
            f'notify-send "{k} | \\${averagePrice}" "{msg_fmt}" -t {str(TIME - cumulative_time)}'
        )
        end = time.time()
        elapsed = round((end - start) * 1000) + 2
        cumulative_time += elapsed


if __name__ == "__main__":
    main()
