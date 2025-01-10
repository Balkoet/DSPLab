
v = VideoReader('500fps_noisy.avi');
i=0;
while hasFrame(v)
    i=i+1;
    I = rgb2gray(im2double(readFrame(v)));
    I2 = medfilt2(I,[4 4]);
    x(i)=I2(293,323);
    
end
y = x - mean(x);
Y = abs(fftshift(fft(y,512)));
F = linspace(-250,250,512);
plot(F,Y);
