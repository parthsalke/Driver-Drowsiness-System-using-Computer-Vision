imannotateopenmap = containers.Map
improcessopenmap = containers.Map
ratioopenmap = containers.Map

numberofphotos=19
for v = 1:numberofphotos

    %read the image open
    imagenameopen = strcat('close',num2str(v),'.jpg');
    
    videoFrame=imread(strcat('personalimages/',imagenameopen));
    EyeTracking
end
