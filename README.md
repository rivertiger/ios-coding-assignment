# iOS Coding Assignment

This is a coding challenge for iOS developers.  

# Prerequisites
Candidate should have Xcode and Git installed on their machine.


# Step 1
Create a new iOS Application "Weather App"
 * For the UI, you can use these mechanisms: Storyboards/XIBs, straight code, or SwifUI.
 * Use the Model-View-ViewModel (MVVM) pattern. Bonus points for also using the Coordinator pattern.

# Step 2

Use the [Open Weather API](https://openweathermap.org/api) to fetch weather details. Here is an example call requesting the hourly temperature and rainfall for the lat/long of New York City, NY.

`https://api.open-meteo.com/v1/forecast?latitude=40.71&longitude=-74.01&hourly=temperature_2m,rain`

Please use the latitude and longitude of the following cities to fetch temperature and rainfall conditions every hour of the day.

| City | Lat  | Long |
| ------- | --- | --- |
| New York | 40.71 | -74.01 |
| Dallas | 32.78 | -96.81 |
| Miami | 25.77 | -80.19 |

Final output will look similar to the following image

![weather app drawio](https://user-images.githubusercontent.com/1957407/206615131-5afcbb18-1d7e-4b38-b9f1-7f4b1333defd.png)


# Functionalties 
1. Fetch the current temperature for the three cities and list their current temperature, along with a rain or sun symbol as appropriate. 
1. Using the segment control to switch Celcius and Farenheat 
1. Clicking on a row will display the full weather report of the selected city for each hour of the day
1. Celcius or Faranhet selected in view 1 should be carried to view 2


# Evaluation
- Clean and readable code
- Knowledge of MVVM, delegation, UI and navigation, fetching and parsing JSON data, git and dependency management




