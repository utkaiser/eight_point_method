function [pi_vector] = compute_pi_vector(M)

[eigenvektoren, ~] = eig(M'*M);
res = eigenvektoren(:,1);
pi_vector = res;

end