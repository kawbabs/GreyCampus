# 1. What is the basic difference and similarity between a vector and a matrix?
# They are both arrays with matrix being a 2D array. While a vector can have any
# dimension i.e it could have one or more dimensions

# 2. What is the basic difference and similarity between a data frame and a matrix?
#  Both matrix and datafram can have rows and columns. However, matrix  has
# fixed number ofrows and columns while dataframe has variable columns and rows

# 3.Create a vector using (15, TRUE, "World"). What happened to your result?
a_vector = c(15,TRUE, 'World')
a_vector
class(a_vector)
# The components of the vector chnaged to character type. I'm guess the types ought
# to be the same else it will be identified as character

# 4. John's score in final semester for the three subjects (95, 91, 88). 
# The Subjects are Statistics, Linear Algebra and Calculus. Using these create a 
# vector and give names to all elements of the vector based on their subjects
john_score = c(95, 91, 88)
john_subject = c('Statistics', 'Linear Algebra','Calculus')
names(john_score) = john_subject
john_score

# 5.Check types (character or numeric) of the vector you created.
class(john_score)
class(john_subject)

# 6. You have three students in your class (Choose any name you want). 
# Create a matrix using their score in above mentioned subjects (question 4) 
# Student 1 (95, 91, 88), Student 2(96, 94, 97), Student 3(88, 98, 85). 
# Create a matrix and also put column and row names.
subjects = c('Statistics', 'Linear Algebra','Calculus')
grade = c(c(95,91,88),c(96, 94, 97),c(88, 98, 85))
grade_matrix = matrix (grade, nrow = 3, byrow = TRUE )
colnames(grade_matrix) = subjects
rownames(grade_matrix) = c('student_1', 'student_2', 'student_3')
grade_matrix

# 7.Convert the created matrix into a data frame.
grade_matrix.df = as.data.frame(t(grade_matrix))
grade_matrix.df

# 8. Create three vectors using 5 countries (your choice) from the below 
# given website. First vector should be country names, second vector should 
# be the total number of cases and third vector should contain total number 
# of deaths. Create a data frame using these vectors. 
country = c('Andorra','Gibralta','Montenegro','Czechia', 'San Marino')
no_of_cases = c (10610, 4227, 70658, 1134957, 3420)
no_of_deaths = c(107, 88, 926, 18913, 72)
covid_df = data.frame(country, no_of_cases, no_of_deaths)
covid_df

# 9. Please read mtcar car dataset from R. It is an in built dataset. 
# Check the structure of the data set. Also, if required, please 
# convert them into their appropriate data types 
# (character, logical, factor, etc). Save your results into a 
# new data frame using a newname.
mtcars
head(mtcars, 5)
str(mtcars)
new_mtcars = transform(mtcars, vs = as.factor(vs), cyl = as.factor(cyl), 
                       am = as.logical(am))
str(new_mtcars)
