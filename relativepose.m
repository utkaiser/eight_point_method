function [R, T] = relativepose(sCoord2D, tCoord2D, K)

[~, num_columns] = size(sCoord2D);

sCoord2D = [sCoord2D; ones(1,num_columns)];
tCoord2D = [tCoord2D; ones(1,num_columns)];

s_vector = inv(K)*sCoord2D;
t_vector = inv(K)*tCoord2D;

a = ones(num_columns,9);

for i=1:num_columns
    x1 = s_vector(1,i);
    x2 = t_vector(1,i);
    y1 = s_vector(2,i);
    y2 = t_vector(2,i);
    a(i,:) = [x2*x1,x2*y1,x2,y2*x1,y2*y1,y2,x1,y1,1]';
end

[~,~,V] = svd(a);
e_not = [V(1, 9), V(2, 9), V(3, 9); V(4, 9), V(5, 9), V(6, 9); V(7, 9), V(8, 9), V(9, 9)];

[U,~,V] = svd(e_not);

%potential e's
e = U*diag([1,1,0])*V';
e_2 = -e;

R_z_plus = [0 -1 0; 1 0 0; 0 0 1];
R_z_minus = [0 1 0; -1 0 0; 0 0 1];

R1 = U*R_z_plus'*V';
R2 = U*R_z_minus'*V';
T1_hat = U*R_z_plus'*diag([1,1,0])*U';
T2_hat = U*R_z_minus'*diag([1,1,0])*U';
T1 = [T1_hat(3,2),T1_hat(1,3),T1_hat(2,1)]';
T2 = [T2_hat(3,2),T2_hat(1,3),T2_hat(2,1)]';

R = R1;
x1 = sCoord2D(:,i); %3x1
x2 = tCoord2D(:,i); %3x1
c = R*x1;%3x1
b_1 = [c -x2]'*T1;%2x1
b_2 = [c -x2]'*T2;%2x1
a = [c -x2]'*[c -x2]; %2x2
lambda_1 = inv(a)*b_1;
lambda_2 = inv(a)*b_2;
if lambda_1(1)>0 && lambda_1(2)>0
    R = R1;
    T = T1;
elseif lambda_2(1)>0 && lambda_2(2)>0
    R = R1;
    T = T2;
end
    

R = R2;
x1 = sCoord2D(:,i); %3x1
x2 = tCoord2D(:,i); %3x1
c = R*x1;%3x1
b_1 = [c -x2]'*T1;%2x1
b_2 = [c -x2]'*T2;%2x1
a = [c -x2]'*[c -x2]; %2x2
lambda_1 = inv(a)*b_1;
lambda_2 = inv(a)*b_2;
if lambda_1(1)>0 && lambda_1(2)>0
    R = R2;
    T = T1;
elseif lambda_2(1)>0 && lambda_2(2)>0
    R = R2;
    T = T2;
end

det_R = det(R);

disp("det(R)");
disp(det(R));
disp("R");
disp(R);
disp("T");
disp(T);

end