# run_analysis.R


As the problem description mentions each stepto be done, so I will be explaining how the code performed the required steps.


Before performing any step, we downloaded the zip file manually to our local computer and unzipped the data. We too set our working directory to the folder which contains the data.


##Step 1

We firstly read the test data containing data,activity and subject using read.table() function from utils package and then combined it into a data frame called test using cbind() function from base package.
We repeated the same for the training data and created the data frame named train.
The dimensions of test and train are 2947X563 and 7352X563 respectively.
Now we used rbind() again from base package to create a merged data frame known as merged data.


##Step 4

We read the features.txt file to read the features and making a vector cn containing labels. We then assigned the colnames() of mdata to cn vector.


##Step 2

We extracted the columns which are related to mean and standard deviation using grepl() function from base package and find columns whose names contain mean,std,activity or subject. activity or subject because we can retain those columns. We extracted this and saved it in mdata only.


##Step 3

We assigned the activity column values its descriptive name. Using which() from base package to find which indices in the data frame has a particular activity number and then assigning values at those indices the activity name related to that activity number.


##Step 5

We have to claculate mean of every column for each combination of activity and subject. We can use aggregate function from stat package and use the formula method to do so. We applied the aggregate() function on mdata columns except subject and activity and saved the result in a new data frame called res.

The res data frame in the last step is our required tidy data set. We saved it in a file named resdata.txt using write.table() from utils package.


##Some important variable names and what they contain:

test :Merged data of test data.

train :Merged data of train data.

mdata :Initially the merged data of test and train and then performing other operations and steps on it.

res :The resultant tidy data frame.


Note: The merged data set which is formed is first step is mdata and then at every step the mdata is changed with the operations to be performed in that step, no new data frame is created until step 5 to store the main data.
