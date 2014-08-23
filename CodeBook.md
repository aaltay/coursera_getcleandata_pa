# CodeBook

## Data2
* subject - Subject id, a numeric value from 1 to 30
* activity - Same as Data1

Other variables, all in the form meanOfXXX where XXX is a variable name defined for Data1. This is a
numeric value and calculated as mean of XXX variable for the given subject/activity pair.

## Data1
* activity - Textual desctiption of activity, one of:

    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING

There are 66 more variables, each of them corresponding to one data point from the base data set. They are in one of the following forms

    1. ...Mean         Mean of the defined feature
    2. ...Mean[X|Y|Z]  Mean of the defined feature for the selected axis
    3. ...Std          Standard deviation of the defined feature
    4. ...Std[X|Y|Z]   Standard deviation of the defined feature for the selected axis

They are all numeric values with no NAs

1. tBodyAccMeanX            
1. tBodyAccMeanY            
1. tBodyAccMeanZ            
1. tGravityAccMeanX        
1. tGravityAccMeanY         
1. tGravityAccMeanZ         
1. tBodyAccJerkMeanX        
1. tBodyAccJerkMeanY       
1. tBodyAccJerkMeanZ        
1. tBodyGyroMeanX           
1. tBodyGyroMeanY           
1. tBodyGyroMeanZ          
1. tBodyGyroJerkMeanX       
1. tBodyGyroJerkMeanY       
1. tBodyGyroJerkMeanZ       
1. tBodyAccMagMean         
1. tGravityAccMagMean       
1. tBodyAccJerkMagMean      
1. tBodyGyroMagMean         
1. tBodyGyroJerkMagMean    
1. fBodyAccMeanX            
1. fBodyAccMeanY            
1. fBodyAccMeanZ            
1. fBodyAccJerkMeanX       
1. fBodyAccJerkMeanY        
1. fBodyAccJerkMeanZ        
1. fBodyGyroMeanX           
1. fBodyGyroMeanY          
1. fBodyGyroMeanZ           
1. fBodyAccMagMean          
1. fBodyBodyAccJerkMagMean  
1. fBodyBodyGyroMagMean    
1. fBodyBodyGyroJerkMagMean 
1. tBodyAccStdX             
1. tBodyAccStdY             
1. tBodyAccStdZ            
1. tGravityAccStdX          
1. tGravityAccStdY          
1. tGravityAccStdZ          
1. tBodyAccJerkStdX        
1. tBodyAccJerkStdY         
1. tBodyAccJerkStdZ         
1. tBodyGyroStdX            
1. tBodyGyroStdY           
1. tBodyGyroStdZ            
1. tBodyGyroJerkStdX        
1. tBodyGyroJerkStdY        
1. tBodyGyroJerkStdZ       
1. tBodyAccMagStd           
1. tGravityAccMagStd        
1. tBodyAccJerkMagStd       
1. tBodyGyroMagStd         
1. tBodyGyroJerkMagStd      
1. fBodyAccStdX             
1. fBodyAccStdY             
1. fBodyAccStdZ            
1. fBodyAccJerkStdX         
1. fBodyAccJerkStdY         
1. fBodyAccJerkStdZ         
1. fBodyGyroStdX           
1. fBodyGyroStdY            
1. fBodyGyroStdZ            
1. fBodyAccMagStd           
1. fBodyBodyAccJerkMagStd  
1. fBodyBodyGyroMagStd      
1. fBodyBodyGyroJerkMagStd 