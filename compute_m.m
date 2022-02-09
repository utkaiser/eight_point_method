function [m_matrix] = compute_m(points,x)
%computes the m matrix for task 1

padding = ones(1,size(points, 2));
points = [points; padding];
m_matrix = zeros(size(points, 2)*2, 12);
x = [x; padding];

i = 1;
while i<=size(points, 2)
    var = x(:,i)';
    m_matrix(2*i-1,9:12) = -var*points(1,i);
    m_matrix(2*i-1,1:4) = var;
    m_matrix(2*i,5:8) = var;
    m_matrix(2*i,9:12) = -var*points(2,i);
    i=i+1;
end


end