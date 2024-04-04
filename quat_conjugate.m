function qStar = quat_conjugate(q)
% function calculating conjugate of a quaternion
% input: 4x1 quaternion, q
% output: 4x1 quaternion, qStar

qStar = [-q(1); -q(2); -q(3); q(4)];

end%function