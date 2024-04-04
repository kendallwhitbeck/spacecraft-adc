function skewMat = skewSymMat(vector)
% function determining the skew-symmetric matrix from a vector
% input: v, 3x1 vector that is before a cross-product
% output: skewMat, 3x3 matrix equivalent to "v-cross" another vector

v = vector; % shortening variable name for readability

skewMat = [    0, -v(3),  v(2);
            v(3),     0, -v(1);
           -v(2),  v(1),     0];

end%function