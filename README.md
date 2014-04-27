getdata-proj-01
===============
Script first loads required data.

Then test and train data are combined.

Correct column names are assigned after loading them from a file.

Activity values are labelled from the "activity_table.txt" with the help of "factor" command.

Column names that contain "-mean()" and "-std()" are used to filter out many columns and remove the column count to 68 from 563.

"reshape2" library is used to help create new tidyData file. By using "melt" and "dcast", tidyData is reduced into 180 rows and 68 columns. The result is written into a file as the final step.
