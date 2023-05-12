import tabula
import pandas as pd

df = tabula.read_pdf("https://github.com/tabulapdf/tabula-java/raw/master/src/test/resources/technology/tabula/arabic.pdf")

df.to_csv("output.csv", index = False)
print(df)