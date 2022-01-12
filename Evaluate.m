%read the image
im1=videoFrame;
awakeprob = [100 85 50 15];
randomnumber = rand(1)*100;

if strcmp(eyestatus ,'OPEN')
        verdict = 'AWAKE';
    else
        verdict = 'SLEEPY';     
end
pause(1)
