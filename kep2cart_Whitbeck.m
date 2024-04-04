function [ xC ] = kep2cart_Whitbeck( mu, xKOE )
% kep2cart : Convert Keplerian classical orbital elements to an
%            inertial state vector (position and velocity).
%% Initial Keplarian Orbital Parameters

% Semi-major Axis
sma  = xKOE(1); % DU
% Eccentricity Vector
ecc  = xKOE(2);
% Inclination
inc  = xKOE(3); % rad
% Right Ascension of Ascending Node
RAAN = xKOE(4); % rad
% Argument of Periapsis
argp = xKOE(5); % rad
% True Anomaly
tru  = xKOE(6); % rad

%% Semiparameter
p = sma * (1 - ecc^2); % DU

%% Position in PQW frame
r_pqw = (p / (1 + ecc * cos(tru))) * [cos(tru), sin(tru), 0]'; % DU

%% Velocity in PQW frame
v_pqw = sqrt(mu / p) * [-sin(tru), (ecc + cos(tru)), 0]'; % DU/TU

%% Transformation Matrix from PQW to ijk
if ecc < 10e-12 && inc < 10e-12
    T = eye(3);
elseif ecc < 10e-12
    T = calc_R3(-RAAN) * calc_R1(-inc);
elseif inc < 10e-12
    
    % True Longitude of Periapsis
%     arg_long_peri = arccos(ecc);
%     long_peri = acos(arg_long_peri);
%     if ecc < 0
%         long_peri = 2*pi - long_peri;
%     end
%     argp = long_peri;
    T = calc_R3(-argp);
else
    T = calc_R3(-RAAN) * calc_R1(-inc) * calc_R3(-argp);
end

%% Position in ijk frame
r_ijk = T * r_pqw; % DU

%% Velocity in ijk frame
v_ijk = T * v_pqw; % DU/TU

%% Inertial Cartesian State Vector (6-by-1): xC
xC = [r_ijk; % DU
    v_ijk]; % DU/TU

end
%% -----------------------------------------------------------------------+
% Author: Kendall Whitbeck
% Date: 2017-10-10
%+========================================================================+

