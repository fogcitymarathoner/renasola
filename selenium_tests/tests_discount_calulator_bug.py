__author__ = 'marc'
import unittest

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
class DiscountCalculatorTestCase(unittest.TestCase):

    def setUp(self):
        self.browser = webdriver.Firefox()
        self.addCleanup(self.browser.quit)

    def testPageTitle(self):
        self.browser.get('http://renesola.sfcrowd.com/renesola/crm/discount_calculator/')
        self.assertIn('Discount Calculator', self.browser.title)

    def testSolarmoduleSubtotal(self):
        self.browser.get('http://renesola.sfcrowd.com/renesola/crm/discount_calculator/')
        calculate_button = self.browser.find_element_by_id("bottom-calculate-action")
        product_category_input = self.browser.find_element_by_id("autocomplete-input-category-1")
        product_category_input.send_keys("Solar Modules");
        calculate_button.click()
        element = WebDriverWait(self.browser, 10).until(
            EC.element_to_be_clickable ((By.ID, "autocomplete-input-product-1"))
        )
        product_input = self.browser.find_element_by_id("autocomplete-input-product-1")
        product_category_input.send_keys("JC275S-24/Bbh_3510T4150Z275_B");
        calculate_button.click()

        time.sleep(5) # wait for get
        element = WebDriverWait(self.browser, 10).until(
            EC.element_to_be_clickable ((By.ID, "sales-price-1"))
        )
        sale_price_input = self.browser.find_element_by_id("sales-price-1")

        print sale_price_input.get_attribute("value")
        #self.assertIn('0.830', sale_price_input.get_attribute("value"))

        self.assertIn('Discount Calculator', self.browser.title)

        # bottom-calculate-action
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        time.sleep(5) # wait for get
        print sale_price_input.get_attribute("value")
        quit()

if __name__ == '__main__':
    unittest.main(verbosity=2)