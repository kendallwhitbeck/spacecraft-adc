function [q3] = quat_mult(q2,q1)
% Function that perform quaternion multiplication between two 4x1
% quaternion inputs. The first quaternion entered (q2) should be the
% "nominal" quaternion, or the quaternion on the left side of the quat_mult
% sign. The second quaternion entered should be the "current" quaternion,
% or the quaternion on the right side of the quat_mult side.
% The output is a 4x1 quaternion (q3)

q1v = q1(1:3);
q1s = q1(4);
q2v = q2(1:3);
q2s = q2(4);

q3s = q2s*q1s - dot(q2v, q1v);

q3v = q2s*q1v + q1s*q2v - cross(q2v, q1v);

q3 = [q3v; q3s];
end