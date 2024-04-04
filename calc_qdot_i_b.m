function qdot_i_b = calc_qdot_i_b(ang_vel_bodyframe,q1)

q2 = [ang_vel_bodyframe; 0]; % shortening variable name

% q1 is the current quaternion & q2 represents the quaternion for the new
% angular velocity

qdot_i_b = 0.5 * quat_mult(q2,q1);

end
