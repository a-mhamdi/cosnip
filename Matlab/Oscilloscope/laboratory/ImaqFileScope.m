global HScopeImage;
obj=videoinput('winvideo', 1);
set(obj, 'selectedsourcename', 'input1');
vidRes = get(obj, 'VideoResolution');
nBands = get(obj, 'NumberOfBands');
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
HScopeImage=preview(obj, hImage);



