# Driver-sleep-detection-and-alarming-system-using-Computer-Vision
This project is to develop a system that can detect the drowsiness of the driver and make alarms accordingly using Computer Vision and Image Processing. It is developed in MATLAB and we have used image processing algorithm also known as Viola Jones algorithm for detection of faces and eyes, the image of eye is continously processed and the ratio of black pixels to white pixels is calculated and based on the bw ratio, the alarm beeps if driver is asleep.

The program contains 4 files:

FILES:
1. SleepDetection.m: Capture a live camera tracking video and comparing the ratio with threshold ratio and giving the output. 
2. EyeTracking.m: Capture and crop eyes for each VideoFrame and calculate the black to white pixels(bw) ratio.
3. Evalute.m: Classify drowsiness based on the measurements returned by EyeTracking.m
4. Tracking.m: Loop through different pictures collected and analyse them.

REQUIREMENTS:
1. Download Image Processing Toolbox in MATLAB.
2. Download Computer Vision Toolbox in MATLAB.

USAGE:

By using Computer Vision in MATLAB, we have created a driver drowsiness detetction system. By using the Image Processing toolbox we have processed the cropped eye from the face and constantly calculating the bw ratio in a interval of 1 sec. 

Once a face is detected, we will take the eye into consideration and crop it out. This will produce the following initial ratio calculations.
Then the image is passed to EyeTracking.m for further bw and threshold calculations. 
To detect whether your eyes are open or closed. Because of your dark pupil, the larger your eyes open, the more black pixels would appear and vice versa.
If the calculated ratio is greater than threshold ratio then your eyes are 'OPEN' and driver is awake and if the ratio falls below threshold then it will play an alarm sound and will display a warning message and will wake up the driver.
By installing it in a vehcile the number of accidents due to fatigue would surely reduce.

