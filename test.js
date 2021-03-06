// Extracted from http://www.chrisle.me/2013/08/running-headless-selenium-with-chrome/

// To run this test:
// cd /pm
// node test.js

var webdriver = require('selenium-webdriver'),
    until = require('selenium-webdriver').until;

// var keyword = "twitter";

var driver = new webdriver.Builder().
   usingServer('http://localhost:4444/wd/hub').
   withCapabilities(webdriver.Capabilities.chrome()).
   build();

driver.get('http://www.greens.org/about/software/editor.txt');
// driver.findElement(webdriver.By.name('q')).sendKeys(keyword);
// driver.findElement(webdriver.By.name('btnG')).click();
// driver.wait(function() {
//   return driver.getTitle().then(function(title) {
//     driver.getPageSource().then(function(html) {
//       console.log(html);
//       return true;
//     });
//   });
// }, 1000);
// driver.wait(until.titleIs('twitter - Google Search'), 1000);
driver.getPageSource().then(function(html) {
    console.log(html);
});

driver.quit();
