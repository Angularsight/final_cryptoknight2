from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

s = Service(ChromeDriverManager().install())
dr = webdriver.Chrome(service=s)
dr.minimize_window()
dr.get('https://wazirx.com/exchange/BTC-INR')

dr.implicitly_wait(30)


def single_coin_data():
    # clicking on 'fx' Button
    dr.find_element(By.XPATH,
                    '//*[@id="root"]/div/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div[1]/button[1]').click()

    dr.implicitly_wait(2)
    dr.switch_to.frame(0)  # switching to the indicators frame

    # getting the path of the searchBox and sending keys
    searchBox = dr.find_element(By.XPATH, '//*[@id="overlap-manager-root"]/div/div/div[1]/div/div[2]/div/input')
    searchBox.send_keys('Bollinger Bands', Keys.ENTER)

    # applying the bollinger bands Fx
    dr.find_element(By.CLASS_NAME, 'main-34wD0nIh').click()

    # closing indicator box
    dr.find_element(By.CLASS_NAME, 'close-3NTwKnT_').click()

    #  opening the fx box within the canvas
    dr.find_element(By.CLASS_NAME, 'toggler-_SUZ7r_5').click()

    # getting Upper and Lower Bollinger values
    ans1 = 0
    ans2 = 0
    new_coin_data = {}
    while True:
        coin_name = dr.find_element(By.XPATH, '/html/body/div[2]/div[1]/div/div[1]/div[2]/table/tr[1]/td[2]/div/div[1]/div[1]/div[1]/div[1]/div[1]').text

        upperBollinger = dr.find_element(By.XPATH,
            '/html/body/div[2]/div[1]/div/div[1]/div[2]/table/tr[1]/td[2]/div/div[1]/div[2]/div[2]/div[3]/div[3]/div/div[3]/div').text
        time.sleep(1)

        lowerBollinger = dr.find_element(By.XPATH,
                                         '/html/body/div[2]/div[1]/div/div[1]/div[2]/table/tr[1]/td[2]/div/div[1]/div[2]/div[2]/div[3]/div[3]/div/div[2]/div').text
        if upperBollinger != ans1:
            print('Upper Bollinger : ', upperBollinger, end='\t')
            new_coin_data['upperBollinger'] = upperBollinger

        if lowerBollinger != ans2:
            print('Lower Bollinger : ', lowerBollinger)
            new_coin_data['lowerBollinger'] = lowerBollinger
        ans1 = upperBollinger
        ans2 = lowerBollinger


        new_coin_data['coinName'] = coin_name
        # new_coin_data['currentPrice'] = coin_price.text
        print(new_coin_data)
        return new_coin_data


def single_coin_2():
    coin_name = dr.find_element(By.CLASS_NAME, 'sc-bwzfXH')
    # coin_price = dr.find_element(By.CLASS_NAME, 'jaArUU')
    ans1 = 0
    ans2 = 0
    new_coin_data = {}
    while True:
        upperBollinger = dr.find_element(By.XPATH,
                                         '/html/body/div[2]/div[1]/div/div[1]/div[2]/table/tr[1]/td[2]/div/div[1]/div[2]/div[2]/div[3]/div[3]/div/div['
                                         '3]/div').text

        upperBollinger = dr.find_element(By.CLASS_NAME, 'valueValue-3kA0oJs5').text
        time.sleep(1)
        # lowerBollinger = dr.find_element_by_class_name('valueValue-3kA0oJs5')
        lowerBollinger = dr.find_element(By.XPATH,
                                         '/html/body/div[2]/div[1]/div/div[1]/div[2]/table/tr[1]/td[2]/div/div[1]/div[2]/div[2]/div[3]/div[3]/div/div['
                                         '2]/div').text
        if upperBollinger != ans1:
            print('Upper Bollinger : ', upperBollinger, end='\t')
            new_coin_data['upperBollinger'] = upperBollinger

        if lowerBollinger != ans2:
            print('Lower Bollinger : ', lowerBollinger)
            new_coin_data['lowerBollinger'] = lowerBollinger
        ans1 = upperBollinger
        ans2 = lowerBollinger

        new_coin_data['coinName'] = coin_name.text
        # new_coin_data['currentPice'] = coin_price.text


        return new_coin_data


# single_coin_data()

if __name__ == "__main__":
    coins = dr.find_elements(By.CLASS_NAME, 'ticker-item')
    j = 0
    overall_coins = {}
    for i in coins:
        data1 = single_coin_data()
        overall_coins[j] = data1
        print(overall_coins)
        j += 1

        if j < 1:
            print(j, end=' ')
            continue
        elif j >= 1 and j < 30:
            # wait = WebDriverWait.until(dr,5)
            # wait.unti(EC.presence_of_element_located(i.get))
            dr.implicitly_wait(2)
            i.click()
            data2 = single_coin_2()
            overall_coins[j] = data2
            time.sleep(2)
        else:
            break

while True:
    pass
