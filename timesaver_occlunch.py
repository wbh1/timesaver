import sys
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

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

instaLogout = driver.find_element_by_id("FRMLogoffAfterTransactionTimestamp")
instaLogout.click()
punchIt = driver.find_element_by_id("bttAddPunch")
punchIt.click()
time.sleep(180)
instaLogout.click()
punchIt.click()

driver.close()