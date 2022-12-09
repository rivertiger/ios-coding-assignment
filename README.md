# iOS Coding Assignment

This is a coding challenge for iOS developers to perform during the interview.  

# Prerequisites
Candidate should have Xcode and Git Installed in his machine 


# Step 1
Create a new iOS Application "Weather App"
You can use Storyboard for the UI or build everything in code or even use SwiftUI.
Use MVVM or Coordinator architecture 

# Step 2

Use the Open Weather API to fetch weather details 
https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&hourly=temperature_2m,rain

Please use follow cities, latitude and longitude to fetch temperature and rainy condition every hour of the day.

| City | Lat  | Long |
| ------- | --- | --- |
| New York | 40.71 | -74.01 |
| Dallas | 32.78 | -96.81 |
| Miami | 25.77 | -80.19 |

Final output will look similar to the following image

![weather app drawio](https://user-images.githubusercontent.com/1957407/206615131-5afcbb18-1d7e-4b38-b9f1-7f4b1333defd.png)


# Functionalties 
1. Fetch the temprature of any 3 cities and list their current templrate 
2. If its currrently raining please show raining icon 
3. Using the segment control to switch Celcius and Farenheat 
4. Clicking on a row will display the full weather report of the selected city for each hour of the day
5. Celcius or Faranhet selected in view 1 should be carried to view 2


# Evaluation
Clean and readable code
Knowledge of MVC, delegation, UI and navigation, fetching and parsing JSON data, git and dependency management




