import sys
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

username = sys.argv[1]
password = sys.argv[2]

driver = webdriver.Firefox()
driver.implicitly_wait(10)
driver.get("https://timesaver.adphc.com/v12/ba6s/TS/login.php")
assert 'ADP TimeSaver' in driver.title

userElem = driver.find_element_by_id("username")
userElem.send_keys(username)
passElem = driver.find_element_by_id("password")
passElem.send_keys(password)
passElem.send_keys(Keys.RETURN)
WebDriverWait(driver, 10).until(EC.title_contains(username))
punchIt = driver.find_element_by_id("bttAddPunch")
punchIt.click()

try:
    WebDriverWait(driver, 5).until(EC.presence_of_element_located(By.ID, "FloatMsgBtn0"))
    acceptIt = driver.find_element_by_id("FloatMsgBtn0")
    acceptIt.click()
except:
    pass

driver.close()