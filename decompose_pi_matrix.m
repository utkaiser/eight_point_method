function [K,R,T] = decompose_pi_matrix(pi_vector)

desired_form = [4,3];
pi_matrix_transposed = reshape(pi_vector, desired_form);
pi_matrix = pi_matrix_transposed';
dummy_mat = pi_matrix(:,1:3);

v_1 = dummy_mat(1,:);
v_2 = dummy_mat(2,:);
v_3 = dummy_mat(3,:);

%algorithm according to formula in class
k_33 = norm(v_3);
r_3 = v_3/k_33;
k_23 = r_3*v_2';
r_2 = v_2-k_23*r_3;
k_22 = norm(r_2);
r_2 = r_2/k_22;
k_13 = r_3*v_1';
k_12 = r_2*v_1';
r_1 = v_1 - k_13*r_3 - k_12*r_2;
k11 = norm(r_1);
K = [k11,k_12,k_13;0,k_22,k_23;0,0,k_33];
inv_K = inv(K); %isolated in case problem with inv
r_1 = r_1/k11;
R = [r_1;r_2;r_3];

T = inv_K * pi_matrix(:,4);

end