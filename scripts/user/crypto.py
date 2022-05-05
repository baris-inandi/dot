import requests
from pprint import pprint
from os import system

tickers = ["ETH", "BNB", "CAKE", "BTC", "FTM", "FTM", "FTM", "FTM", "FTM", "FTM"]

for t in tickers:
    t = t.upper()
    r = requests.get(f"https://api.kucoin.com/api/v1/market/stats?symbol={t}-USDT")
    o = r.json()["data"]
    changePrice = round(float(o["changePrice"]), 4)
    changeRate = round(float(o["changeRate"]), 4)
    averagePrice = round(float(o["averagePrice"]), 4)
    up_down = "🔻" if changePrice < 0 else "🔺"
    msg_fmt = f"{up_down} \${changePrice} ({changeRate}%)"
    system(f'notify-send "{t} | \\${averagePrice}" "{msg_fmt}" -t 30000')
