#The Acme corporation is accused of gender bias in 
#setting starting salaries for newly hired workers.
#The accompanying synthetic dataset lists recent salary
#data of new hires, showing college degree (BS, MS, PhD), 
#gender (M, F), years of previous experience, and 
#starting salary (thousands of dollars).


library(tidyverse)


# Read csv file to create a tibble
NewEmployee <- read_csv(file = "C://Rdata//Acme.csv")

#Delete rows with NA elements
NewEmployee1 <- na.omit(NewEmployee) 

#Verify data
is.tibble(NewEmployee1)  
print(NewEmployee1)

#b1 and c1: 
#Years- summary statistics
summary(NewEmployee1$Years)
sd(NewEmployee1$Years)
table(NewEmployee1$Years)
table(NewEmployee1$Gender)
table(NewEmployee1$Degree)

#Plot histogram to show distribution of experience
ggplot(data = NewEmployee1, aes(x = Years, y = ..count.., fill = ..count..)) +
  geom_histogram(binwidth = 0.5) +
  labs(
  title = "Acme corporation case(based on Experience)",
  x = "Years of Experience(years)",
  y = "Count"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) 

#b2 and c2
#StSalary- summary statistics
summary(NewEmployee1$StSalary)
sd(NewEmployee1$StSalary)
table(NewEmployee1$StSalary)

#Plot histogram to show distribution of salary
ggplot(data = NewEmployee1, aes(x = StSalary, y = ..count.., fill = ..count..)) +
  geom_histogram(binwidth = 3) +
  labs(
  title = "Acme corporation case(based on Starting Salary)",
  x = "Starting Salary(thousands)",
  y = "Count"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) 
  
#b3 and c3  
#Gender - summary statistics
table(NewEmployee1$Gender)
table(NewEmployee1$Gender) / length(NewEmployee1$Gender)

#Plot bar chart to show distribution of gender
ggplot(data = NewEmployee1, aes(x = Gender, y = ..count.., fill = Gender)) +
  geom_bar(stat = "count", width = 0.5) +
  labs(
    title = "Acme corporation case(based on Gender)",
    x = "Gender",
    y = "Count"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) 


#b4 and c4  
#Degree - summary statistics
table(NewEmployee1$Degree)
table(NewEmployee1$Degree) / length(NewEmployee1$Degree)

#Plot bar chart to show distribution of educational degree
ggplot(data = NewEmployee1, aes(x = Degree, y = ..count.., fill = Degree)) +
  geom_bar(stat = "count", width = 0.5) +
  labs(
    title = "Acme corporation case(based on Degree)",
    x = "Degree",
    y = "Count"
  ) +
theme(plot.title = element_text(hjust = 0.5)) 


#d1 Years of Experience and Starting Salary for all employees
ggplot(data = NewEmployee1, aes(x = Years, y = StSalary)) +
  #geom_point(color = "Blue", alpha = .5, size = 3) +  #Many points overlap with each other
  geom_jitter(color = "Blue", alpah = .5, size = 3) +  #handle overplotting
  geom_smooth(color = "Red", size = 1) +
  labs(
   title = "Acme corporation case(Experience,Starting Salary)",
   x = "Years of Experience(years)",
   y = "Starting Salary(thousands)"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) 


#d2 Years of Experience and Starting Salary for each gender 
ggplot(data = NewEmployee1, aes(x = Years, y = StSalary, shape = Gender, fill = Gender, color = Gender)) +
  geom_jitter(size = 3) +
  #facet_wrap(~Gender) +
  geom_smooth(size = 1, se = FALSE) +
  labs(
    title = "Acme corporation case(Experience,Starting Salary,Gender)",
    x = "Years of Experience(years)",
    y = "Starting Salary(thousands)"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) 


#d3 Years of Experience and Starting Salary for each degree
ggplot(data = NewEmployee1, aes(x = Years, y = StSalary, shape = Degree, fill = Degree, color = Degree)) +
  geom_jitter(size = 3) +
  #facet_wrap(~Degree) + 
  geom_smooth(size = 1) +
  labs(
    title = "Acme corporation case(Experience,Starting Salary,Degree)",
    x = "Years of Experience(years)",
    y = "Starting Salary(thousands)"
  ) +
  theme(plot.title = element_text(hjust = 0.5)) 

#e Calculate correlation coefficient between Starting Salary and Years of Experience
cor(NewEmployee1$StSalary, NewEmployee1$Years)

#e Calculate P-value
PVModel <- lm(NewEmployee1$StSalary~NewEmployee1$Years, data = NewEmployee1)
summary(PVModel)

#e1 Calculate correlation coefficient between Starting Salary and Years of Experience(Female)
Female_data <- dplyr::filter(NewEmployee1, grepl("F", NewEmployee1$Gender))
cor(Female_data$StSalary, Female_data$Years)

#e1 Calculate correlation coefficient between Starting Salary and Years of Experience(Male)
Male_data <- dplyr::filter(NewEmployee1, grepl("M", NewEmployee1$Gender))
cor(Male_data$StSalary, Male_data$Years)

#e2 Calculate correlation coefficient between Starting Salary and Years of Experience(BS degree)
BS_data <- dplyr::filter(NewEmployee1, grepl("BS", NewEmployee1$Degree))
cor(BS_data$StSalary, BS_data$Years)

#e2 Calculate correlation coefficient between Starting Salary and Years of Experience(MS degree)
MS_data <- dplyr::filter(NewEmployee1, grepl("MS", NewEmployee1$Degree))
cor(MS_data$StSalary, MS_data$Years)

#e2 Calculate correlation coefficient between Starting Salary and Years of Experience(PhD)
PhD_data <- dplyr::filter(NewEmployee1, grepl("PhD", NewEmployee1$Degree))
cor(PhD_data$StSalary, PhD_data$Years)

