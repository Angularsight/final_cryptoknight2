class CoinClass :
    def __init__(self, coin_name, current_price, upper_bollinger, lower_bollinger):
        self.coin_name = coin_name
        self.current_price = current_price
        self.upper_bollinger = upper_bollinger
        self.lower_bollinger = lower_bollinger


if __name__ == "__main__":
    CoinClass("BTC", "345", "12.0", "23")
