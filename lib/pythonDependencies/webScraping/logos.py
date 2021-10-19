from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

s = Service(ChromeDriverManager().install())
dr = webdriver.Chrome(service=s)
dr.minimize_window()
dr.get('https://wazirx.com/exchange/BTC-INR')

dr.implicitly_wait(6)
class_name = dr.find_elements_by_class_name("sc-EHOje")

logo_dict = {}
for index in class_name:
    logo_dict[index.get_attribute("alt")] = index.get_attribute("src")
    # logo_list.append(index.get_attribute("src"))

print(logo_dict)
# print(class_name.get_attribute("src"))
while True:
    pass