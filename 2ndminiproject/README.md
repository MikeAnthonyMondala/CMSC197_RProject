An age range of 19 to 48 years old has been used to conduct the trials.
A Samsung Galaxy S II phone was worn around the waist of each participant as they did 
six different activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, 
STANDING, and LAYING). Its built-in accelerometer and gyroscope allowed us to measure 
3-axis linear acceleration and 3-axis rotational velocity at a constant 50Hz rate. 
In order to manually identify the data, the tests were videotaped. 
70 percent of the volunteers were used to generate training data, and 30 percent were 
used to generate test data from the obtained dataset, which was randomly partitioned.


A noise filter was used to reduce the signal noise before sampling the accelerometer and 
gyroscope data in 2.56 second sliding windows with a 50% overlap (128 measurements per 
window). A Butterworth low-pass filter was used to separate the gravitational and body 
motion components of the sensor acceleration data. A filter with a cutoff frequency of 
0.3 Hz was utilized since only low frequency components of gravitational force are expected. 
The time and frequency domain variables were used to calculate a feature vector from each 
window.