# R-Dataset-Exploration: Gender Bias
Whether the Acme corporation has gender bias by analyzing starting salaries they provided for newly hired workers.


The Acme corporation is accused of gender bias in 
setting starting salaries for newly hired workers.
The accompanying synthetic dataset lists recent salary
data of new hires, showing college degree (BS, MS, PhD), 
gender (M, F), years of previous experience, and 
starting salary (thousands of dollars).

Using RStudio 1.1.456, explore the Acme.csv dataset:

a) identify the data types in the dataset

b) produce summary statistics for each data item

c) produce visualizations of each data item

d) display the relationship between 

	Years of Experience and Starting Salary for all employees
	
	Years of Experience and Starting Salary for each gender
	
 	Years of Experience and Starting Salary for each degree
  
e) is there a correlation between Starting Salary and Years of Experience?  - Correlation coefficient = 0.69

	is it different for each gender?  
		- Correlation coefficient(Female) = 0.74
		- Correlation coefficient(Male) = 0.67
	
	is it different for each degree?
		- Correlation coefficient(BS) = 0.35
		- Correlation coefficient(MS) = 0.45
		- Correlation coefficient(PHD) = 0.15
	
f) what can you conclude about Acme with respect to gender bias?

	- Female with 1 – 6 years of experience get lower average starting salary than male with the same years of experience and the 		same educational degree. (There is only one female employee with more than 6 years of experience, so it is hard to draw 		conclusion between 7-10 years)

	- There is only one female with more than 6 years of experience, and there are 14 males with more than 6 years of experience. 


