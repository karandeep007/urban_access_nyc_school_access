import pandas as pd

schools_df = pd.read_csv("G:/Redrock/Stevens/Datasets/Public_School_Locations/Public_Schools_2011-2012A.csv",header=0,index_col='ZIP')
US_zip = pd.read_csv("G:/Redrock/Stevens/Datasets/zip_codes_states.csv",header=0,index_col='zip_code')

schools_df.drop(['PRINCIPAL','PRIN_PH'],axis=1,inplace=True)

result = pd.merge(schools_df,US_zip,how='left',left_index=True,right_index=True)

result.to_csv("school-locator.csv")
#print(schools_df.head())
#print(US_zip.head())
print(result.head())