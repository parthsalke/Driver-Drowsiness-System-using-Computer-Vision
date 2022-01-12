%read the image
im1=videoFrame;

% Get EyeDetector Object
DetectorEye =  vision.CascadeObjectDetector('RightEye');
% only one eye is being used

EyeBBOX =step(DetectorEye,im1);

% Annotate
detpic = insertObjectAnnotation(im1,'rectangle',EyeBBOX,'Eye','Color','yellow','TextColor','black');

% Getting the last box and crop
EyeBBOX=EyeBBOX(1,:);
eye3 = imcrop(im1,EyeBBOX);

% Process the image to bw
eye4=im2bw(eye3,0.1);
eye5=imclose(eye4, strel('sphere',4));

whitepixels = sum(eye5);
blackpixels = numel(eye5) - whitepixels ;
ratio = blackpixels  / whitepixels;
