import bs4 as bs
import urllib.request

sauce = urllib.request.urlopen('http://schoolqualityreports.nyc/reports/dashboard.html#dbn=02M267&report_type=EMS&view=City').read()
soup = bs.BeautifulSoup(sauce,'lxml')

rank = soup.find_all("div",class_="report-select-school")

print(soup)



