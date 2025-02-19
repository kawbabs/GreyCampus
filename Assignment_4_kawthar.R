# ## Case I

# I. Data: The World Values Survey is an ongoing worldwide survey that polls the world
# population about perceptions of life, work, family, politics, etc. The most recent
# phase of the survey that polled 77,882 people from 57 countries estimates that
# 36.2% of the world's population agrees with the statement "Men should have more
# right to a job than women." The survey also estimates that 13.8% of people have
# a university degree or higher and that 3.6% of people fit both criteria.

# Question 1: is agreeing with the statement "Men should have more right to a job 
# than women" and having a university degree or higher disjoint event?

#The events are not disjoint as 3.6% of respondents have higher degree and agree with 
# the statement 'Men should have more right to a job than women'

population = 77882
prob_A = 0.362  #Event A = agreeing with the statement
prob_B = 0.138 # Event B = Having a university degree
prob_A_and_B = 0.036 # Probability of A and B. Since this isn't zero, the events aren't disjoint
prob_neither = 1- prob_A - prob_A_and_B - prob_B
prob_neither #prob_neither = 0.464

# Question 2: Draw a Venn diagram summarizing the variables and their associated 
# probabilities.

library(VennDiagram)
grid.newpage()
draw.pairwise.venn(
  area1 = prob_A, area2 = prob_B, cross.area = prob_A_and_B,
  category = c('Agrees with statement', 'Has university degree'),
  lty = rep("blank"), fill = c("light blue", "pink"),
  alpha = rep(0.5, 2), cat.pos = c(0, 0), cat.dist = rep(0.025, 2)
)

# Question 3: What is the probability that a randomly drawn person has a 
# university degree or higher or agrees with the statement about men having 
# more right to a job than women?

prob_A_or_B = prob_A + prob_B
prob_A_or_B #prob_A_or_B = 0.5

# Question 4: What percent of the world population do not have a university degree 
# and disagree with the statement about men having more right to a job than women?

prob_neither = 1- prob_A - prob_A_and_B - prob_B
prob_neither #prob_neither = 0.464

# Question 5: Does it appear that the event that someone agrees with the statement 
# is independent of the event that they have a university degree or higher?

#independent means P(A and B) = P(A)*P(B)
# P(A and B) = prob_A_and_B = 0.036
prob_A *prob_B #0.049956 = P(A)*P(B)
#P(A)*P(B)!=P(A and B), thus the two events are independent

# Question 6: What is the probability that at least 1 in 5 randomly selected 
# people to agree with the statement about men having more right to a job than women?
prob_one_five = 1 - (1-prob_A)^5
prob_one_five #prob_one_five = 0.8942931

# Case II. 
# 
# Data: As of 2009, Swaziland had the highest HIV prevalence in the world. 
# 25.9% of this country's population is infected with HIV. The ELISA test is 
# one of the first and most accurate tests for HIV. For those who carry HIV, 
# the ELISA test is 99.7% accurate. For those who do not carry HIV, the test 
# is 92.6% accurate. 

# Question1: If an individual from Swaziland has tested positive, 
# what is the probability that he carries HIV? Create a tree diagram to calculate 
# the probability.
P_hiv = 0.259
p_not_hiv = 1- P_hiv
p_pos_given_hiv = 0.997
p_neg_not_hiv = 0.926
p_neg_given_hiv = 1- p_pos_given_hiv
p_pos_not_hiv = 1- p_neg_not_hiv

p_hiv_and_pos = P_hiv*p_pos_given_hiv
p_hiv_and_neg = p_hiv*p_neg_given_hiv

p_not_hiv_and_pos = p_not_hiv*p_pos_not_hiv
p_not_hiv_and_neg = p_not_hiv*p_neg_not_hiv

p_positve = p_hiv_and_pos + p_not_hiv_and_pos
p_hiv_given_negative = p_hiv_and_pos/p_positve
p_hiv_given_negative # p_hiv_given_negative = 0.8248434


# Question 2: According to a 2013 Gallup poll, worldwide only 13% of employees are 
# engaged at work (psychologically committed to their jobs and likely to be making 
# positive contributions to their organizations). Among a random 
# sample of 10 employees, what is the probability that 8 of them are engaged at work?

dbinom(8, 10, 0.13)
# Ans = 2.77842e-06

# Question 3: Recent study: “Facebook users get more than they give”
# 
# - friend requests: 40% made, 63% received at least one
# - likes: liked 14 times, had their content “liked” 20 times, on average
# - messages: sent 9 messages, received 12, on average
# - tags:12% tagged a friend in a photo, but 35% tagged other findings:
# - 25% considered power users
# - average Facebook user has 245 friends
# - P(70 or more power user friends) = ?

sum(dbinom(70:245, size = 245, p = 0.25))

# Question 4: According to a 2014 Gallup poll, 56% of uninsured Americans who plan 
# to get health insurance say they will do so through a government health insurance 
# exchange. What is the probability that in a random sample of 10 people exactly 6 
# plan to get health insurance through a government health insurance exchange?
dbinom(6, 10, 0.56)
  #ans = 0.2427494
  