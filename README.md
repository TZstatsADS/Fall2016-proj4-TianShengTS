# Project: Music & Lyrics

### [Project Description](doc/Project4_desc.md)

![image](http://www.drodd.com/images15/music9.jpg)

Term: Fall 2016

+ [Data link](https://courseworks2.columbia.edu/courses/11849/files/folder/Project_Files?preview=763391)-(**courseworks login required**)
+ [Data description](doc/readme.html)
+ [Presentation link](http://prezi.com/biyahojmsvrg/?utm_campaign=share&utm_medium=copy)
+ Contributor's name: Tian Sheng
+ Projec title: Music & Lyric
+ Contributor's name: Tian Sheng
+ Projec title: Music Analysis: Music features and lyics
# Project summary: 
+ Investigate the relationship between the music features and lyrics
+ Generate a classification method using topic modeling and Random Forest
+ Predict the rank of 5000 words  in the dictionary when given new music features

## Project Process
   Descriptions are in the project.rmd file in lib
# Part 1: Extracting Features from the original 2,350 songs
+ (1)Define woking paths
+ (2)Check whether songs in training set have 0 dim features
+ (3)Find out median dimension of different features using training data
+ (4)Define the 1 dimension and 2 dimension feature processing functions
+ (5)Convert training data
+ (6)Train PCA model using training data 
+ (7)After the training process, we get a PCA matrix, and a train.csv


# Part 2: Topic Modeling
+ (1)Define a string convert function to convert the strings in lyr.r
+ (2)Define a matrix convert to convert the strings into matrix
+ (3)Using the LDA to do 20-topic modeling and assign labels to each song
+ (4)Calculate the probability matrix each word appears in each topic

   After the topic modeling part, we get the adjust_proportion.csv and the label_k20.csv

# Part 3: Classification
+  (1)Used KNN and Random Forest Moldeling to link the topics and words 
+  (2)In the classification part, we get a music_rf model to predict the probablity of each topic when train.csv is given.


# Part 4: Rank
+ (1)Convert the test data and apply the PCA matrix on test data
+ (2)Using the Random Forest model to classify the features 
+ (3)Using the adjust_proportion_20.csv and predition_100 to calculate the probability that each word may appear in one song, give the final rank 

# Part 5: Association Rule
+ (1)Construct 6 new variables
+ (2)Calculate the median, variance, min and max  using 6 variables
* Duration: Max value from Segments_start
* Pace: Calculate the mean of difference from 4 variables: bars, beats, segment, tatums
* Sections: Subtract from diff(sections_start)/duration
* Loudness: Subtract from Segments_loudness_max
* Pitches: Subtract from Segments_pitches
* Timbre: Subtract from Segments_timbre	
+ (3)Use the assciation rule to find the relationship between topics and music features
Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
