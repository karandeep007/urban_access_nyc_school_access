import  pandas as pd
import numpy as np

def normal(x):


    return

school_initial = pd.read_csv("G:/Redrock/Stevens/Datasets/finalschool_qualitymerge.csv",header =0)
# print(school_initial.head())
type1 = {"Exceeding Target": 4 ,"Meeting Target" : 3,"Approaching Target" : 2,"Not Meeting Target" : 1}
type2 = {"Well Developed" : 4.99,"Proficient": 3.5,"Developing": 2.0,"Underdeveloped": 1.0}

for index, row in school_initial.iterrows():

    if row["Quality.Review.Rating"] in type2.keys():
        school_initial.set_value(index,"Q_Score",type2[row["Quality.Review.Rating"]])
    else:
        school_initial.set_value(index, "Q_Score",0)
    if row["Progress.Rating"] in type1.keys():
        school_initial.set_value(index,"P_Score",type1[row["Progress.Rating"]])
    else:
        school_initial.set_value(index, "P_Score",0)
    if row["Achievement.Rating"] in type1.keys():
        school_initial.set_value(index,"A_Score",type1[row["Achievement.Rating"]])
    else:
        school_initial.set_value(index, "A_Score",0)
    if row["Environment.Rating"] in type1.keys():
        school_initial.set_value(index,"E_Score",type1[row["Environment.Rating"]])
    else:
        school_initial.set_value(index, "E_Score",0)
    if row["Closing.the.Achievement.Gap.Rating"] in type1.keys():
        school_initial.set_value(index,"CG_Score",type1[row["Closing.the.Achievement.Gap.Rating"]])
    else:
        school_initial.set_value(index, "CG_Score",0)

list_total=['Q_Score','P_Score','A_Score','E_Score','CG_Score']

school_initial["Total_Score"]=school_initial[list_total].sum(axis=1)


scale_a=0
scale_b=10
mini=0 #(recorded lowest)
maxi=20.99

for i, row in school_initial.iterrows():
    val= round(
                ( (( (scale_b-scale_a)*(row["Total_Score"]-mini))
                        /(maxi-mini))+scale_a)
            ,2)
    # if val <0:
    #     val=0
    school_initial.set_value(i,"Norm_Score",val)

print(school_initial.head())

school_initial.to_csv("G:/Redrock/Stevens/Datasets/school_normalised_score-V3.csv")