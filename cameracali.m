function [K] = cameracali(Coord2d, Coord3d)
% output: K in R3×3 is an upper-right matrix that encodes the intrinsic camera parameters

m_matrix = compute_m(Coord2d,Coord3d);
pi_vector = compute_pi_vector(m_matrix);
[K,R,T] = decompose_pi_matrix(pi_vector);
%normalization
K = K/K(3,3);
disp(K);
disp(R);
disp(T);
end