library(plyr)

##Loading train and test sets

## Step 1: merging train and test data sets
subject_train <- read.table('train/subject_train.txt')
x_train <- read.table('train/X_train.txt')
y_train <- read.table('train/y_train.txt')


subject_test <- read.table('test/subject_test.txt')
x_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')

res_train <- cbind(x_train, y_train, subject_train)
res_test  <- cbind(x_test,  y_test,  subject_test)

result <- rbind (res_train, res_test)

##Step 4: Bringing step 4 here to simplify renaming column names process.
columns <- read.table('features.txt')
names(result)[1:561] <- as.vector(columns[1:nrow(columns),2])
names(result)[562:563] <- c("num_activity","subject")


##Step 2: Extract mean and std. deviation variables. Columns extracted from features.txt. Also included variable #562, which represents activity
dataset <- result[, c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543,562,563)]


##Step 3: Rename activities with activity_labels.txt labels
activity <- read.table('activity_labels.txt')

data <- data.frame()
for(i in 1:6){
  subset <- dataset[dataset$num_activity==activity[i,1],]
  subset$activity <- activity[i,2]
  data <- rbind(data,subset)
}

##Step 5: Create a second tidy data

finaldata <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(x = finaldata, file = 'tidy_dataset.txt',row.names = FALSE)