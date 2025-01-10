img = imread('photo-deg.jpg');
%img2 = im2gray(img); NO NEED FOR THAT ONE

%img = imread('photo.jpg')
%img2 = imnoise(img,'salt & pepper',0.1);

imshow(img);
y = medfilt2(img,[6 6]);
figure
imshow(y)