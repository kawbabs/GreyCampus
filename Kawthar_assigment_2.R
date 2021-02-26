# 1. Result of final world cup of football is France- 4 and Croatia – 2. 
# Please use the control structure to print results as 
# Team ---- Wins. ----- should be country name.
France_score = 4
Croatia_score = 2 
if (France_score> Croatia_score){
  print('Team France wins')
}else{
  print('Team Croatia wins')
}

# 2.mtcars dataset has several factor variables. 
# However, R is reading them numeric. Please convert them into factor 
# using a for loop. Please use column 8 to 11 for loop.
mtcars
str(mtcars)
for (i in 8:11){
 mtcars[i] = lapply(mtcars[i], factor)
}
str(mtcars)


# Here is the Dataset 2.1 for the following question. 
# This dataset is a subset of a real dataset.
getwd()
library(readxl)
new_dataset = read_excel( "C:/Users/User/Desktop/kawthar/GreyCampus/GreyCampus/Dataset - 2.1.xlsx")
str(new_dataset)
dim(new_dataset)
# 1.Write a function to get percentage of NAs in each column.

nas_percent = function(nas_col){
  nas_col = colSums(is.na(new_dataset))
  nas_col = (nas_col/dim(new_dataset)[1])*100
  #print(nas_col)
}
nas_percent()

# 2. Write a function to get percentage of NAs in each row.

nas_row_percent = function(nas_row){
  nas_row = rowSums(is.na(new_dataset))
  nas_row = (nas_row/dim(new_dataset)[1])*100
  #print(nas_row)
}

nas_row_percent()

# 3. Write a function to get summary of numeric columns (use summary function) 
# such as THC, CO, CO2 etc. in data set. In same function try to generate 
# boxplot using base R.
library("dplyr")
num_col = data.frame(select_if(new_dataset,is.numeric))
num_col_sumry = function(x){
  summary(x)
 }

num_col_sumry(num_col2$ID)
boxplot(num_col$Year)

# 4. Write a function to create histograms of numeric columns such as THC, 
# CO, CO2 etc. in data set. Use ggpot2 to generate figure.

library("ggplot2")
fun_hist = function(data,x){
  ggplot(new_dataset, aes(x))+
    geom_histogram(colour="black",fill="grey", binwidth=1)
}
fun_hist(num_col, num_col$Test.Veh.Displacement.L)

# Here is the Dataset 2.2 for the following question. 
# This dataset is a subset of a real dataset.
# 
# 1. Data set contains date columns. All of these date columns are untidy. 
# Please create a better formatted dataset. Date should be dd/mm/yyyy in 
# final format. Use column 2, 3 and 5 only
getwd()
library(readr)
data = read_csv("C:/Users/User/Desktop/kawthar/GreyCampus/GreyCampus/Data set - 2.2.csv")
str(data)

library(lubridate)

data$`First FD Date` = mdy(data$`First FD Date`)
format(data$`First FD Date`, "%d/%m/%y") 

data$`Last FD Date` = mdy(data$`Last FD Date`)
format(data$`Last FD Date`,"%d/%m/%y")

data$`FD termination date` = mdy(data$`FD termination date`)
format(data$`FD termination date`, "%d/%m/%y")

# 2.Date of birth column contains month in string format. 
# Please create a tidy data column with months in numeric format. 
# Now your data should be similar to previous question.
date_of_birth = dmy(data$`Date of Birth`, locale = 'english')
date_of_birth = as.Date(date_of_birth, format= '%d/%m/%y')
date_of_birth = as.Date(format(date_of_birth, '19%y%m%d'), '%Y%m%d')
date_of_birth

# 3.Convert all dates into Date format; they are currently in character
# variable format.
first_FD_date = as.Date(data$`First FD Date`)
last_FD_date = as.Date(data$`Last FD Date`)
FD_termination_date = as.Date(data$`FD termination date`)

# 4.Create a new column age based on date of birth column and 
# First FD column. Date format is necessary to do basic arithmetic.

age = (FD_termination_date - date_of_birth)/365
age
