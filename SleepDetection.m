%Create the face detector object.
Detect = vision.CascadeObjectDetector();

Track = vision.PointTracker('MaxBidirectionalError', 2);
wc = webcam();
 
while true
    disp ('==========================================')
    disp ('------------------------------------------')
    disp ('::::::::::::::::::::::::::::::::::::::::::')
    disp ('|||||||||||- WELCOME ONBOARD -||||||||||||')
    disp ('::::::::::::::::::::::::::::::::::::::::::')
    disp ('------------------------------------------')
    disp ('==========================================')

    disp('Open your eyes while picture is taken')
    pause(3)
    videoFrame = snapshot(wc);
    frameSize = size(videoFrame);

    try
        EyeTracking
        originalr=ratio;
        threshold = originalr*0.95;
        break
    catch exception
        disp('Person is not detected. Please take a picture again')
    end
end
% Create the video player
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);
    
runLoop = true;
numPts = 0;
frameCount = 0;

while runLoop 
    videoFrame = snapshot(wc);
    
%  prepare sound samples
    filename = 'beep2.wav';
    [y,Fs] = audioread(filename);
    samples = [1,2*Fs];
    clear y Fs;
    [y,Fs] = audioread(filename,samples);

    try
%to compare ratio & threshold
        EyeTracking
        if ratio >threshold  
            eyestatus='OPEN';
        else
            eyestatus='CLOSED';
        end

        Evaluate
               
        if strcmp(eyestatus,'CLOSED')
            disp(['Driver Alert, Warning, Rest Now!']);
            sound(y,Fs);
        else
            disp(['Driver is Awake. Eyes are OPEN']);
        end
        
    catch exception
        disp('Driver not detected');
        sound(y,Fs);
    end
    
% Display a bounding box
    videoFrame = insertShape(videoFrame, 'rectangle', EyeBBOX, 'LineWidth', 3);

    % Display
    step(videoPlayer, videoFrame);
    runLoop = isOpen(videoPlayer);
end

clear wc;
release(videoPlayer);
release(Track);
release(Detect);
