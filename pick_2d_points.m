function [points] = pick_2d_points(image, num_points, marker_type, color)
%enables user to pick 'num_points' 2d pints and display it

figure;
imshow(image);
hold on;

i = 1;
while i<=num_points
    [x,y] = ginput(1);
    plot(x, y, marker_type, 'color', color, 'markerSize', 10);
    points(2,i) = y;
    points(1,i) = x;
    i = i+1;
end

hold off;
end
