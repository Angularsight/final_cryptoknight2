from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

s = Service(ChromeDriverManager().install())
dr = webdriver.Chrome(service=s)
dr.maximize_window()
dr.get('https://wazirx.com/exchange/BTC-INR')

dr.implicitly_wait(7)
def baba_bandre_teri_eega():
    # clicking on 'fx' Button
    dr.find_element_by_xpath(
        '//*[@id="root"]/div/div[2]/div/div[2]/div/div[1]/div/div/div[2]/div[1]/div[1]/button[1]').click()

    dr.implicitly_wait(2)
    dr.switch_to.frame(0)  # switching to the indicatiors frame

    # getting the path of the searchBox and sending keys
    searchBox = dr.find_element_by_xpath('//*[@id="overlap-manager-root"]/div/div/div[1]/div/div[2]/div/input')
    searchBox.send_keys('Bollinger Bands', Keys.ENTER)

    # applying the bollinger bands Fx
    dr.find_element_by_class_name('main-34wD0nIh').click()

    # closing indicator box
    dr.find_element_by_class_name('close-3NTwKnT_').click()

    #  opening the fx box within the canvas
    dr.find_element_by_class_name('toggler-_SUZ7r_5').click()

    # getting Upper and Lower Bollinger values
    ans1 = 0
    ans2 = 0
    while True:
        upperBollinger = dr.find_element_by_xpath(
            '/html/body/div[2]/div[1]/div/div[1]/div[2]/table/tr[1]/td[2]/div/div[1]/div[2]/div[2]/div[3]/div[3]/div/div['
            '3]/div').text
        time.sleep(2)
        lowerBollinger = dr.find_element_by_xpath(
            '/html/body/div[2]/div[1]/div/div[1]/div[2]/table/tr[1]/td[2]/div/div[1]/div[2]/div[2]/div[3]/div[3]/div/div['
            '2]/div').text
        if upperBollinger != ans1:
            print('Upper Bollinger : ', upperBollinger, end='\t')

        if lowerBollinger != ans2:
            print('Lower Bollinger : ', lowerBollinger)
        ans1 = upperBollinger
        ans2 = lowerBollinger

while True:
    pass
