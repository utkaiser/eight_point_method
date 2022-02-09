function main()


%task 1
% image = imread('data/Calibration.jpg');
% Coord2d = pick_2d_points(image,6,'+','r');
% Coord3d_a = [8,0,0;6,1,4;0,7,3;8,5,4;3,0,3;0,1,1]'; %000 is down in the middle
% Coord3d_b = [7,7,4;5,0,0;5,0,3;0,0,3;0,5,3;0,5,0]';
% Coord3d_c = [0,0,0;0,0,4;8,0,0;0,8,0;8,8,4;8,0,4]';
% [K] = cameracali(Coord2d, Coord3d_b);

K = [4067.8 -10.9 2444.8; 0 3739.0 1291.4; 0 0 1];

%task 2

image_s = imread('data/SourceImage.jpg');
image_t = imread('data/TargetImage.jpg');
sCoord2D = pick_2d_points(image_s,8,'+','r');
tCoord2D = pick_2d_points(image_t,8,'o','g');

figure; ax = axes;
showMatchedFeatures(image_s,image_t,sCoord2D',tCoord2D','montage','Parent',ax);
title(ax, 'Candidate points matches');
legend(ax, 'Source points','Target points');

[R, T] = relativepose(sCoord2D, tCoord2D, K);

end 