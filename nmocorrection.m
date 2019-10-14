function seisnmo = nmocorrection(t, dt, offset, seisdata, vnmo)

%nmocorrection   NMO correction of CMP gather
%
%   seisnmo = nmo_correction(t, dt, offset, seisdata, vnmo) applies NMO
%   correction to a CMP gather according the provided NMO velocities.
%
%   Input:
%   -t: Vector containing the travel times of the seismic data
%       (in seconds).
%   -dt: Number containing the time sampling of the seismic data
%        (in seconds).
%   -offset: Vector containing the source-receiver distance for each
%            seismic trace (in meters).
%   -seisdata: Matrix containing columns of seismic traces.
%   -vnmo: Vector containing NMO velocities (in meters/second).
%
%   Output:
%   -seisnmo: Matrix containing columns of NMO corrected seismic traces.

% Initialize NMO corrected gather
seisnmo = zeros(size(seisdata));

% Apply NMO correction for each time sample in each trace of CMP gather
for k = 1 : size(seisdata, 1)
    for l = 1 : size(seisdata, 2)
        reflectime = sqrt(t(k)^2 + (offset(l))^2 / vnmo(k)^2);
        if reflectime >= dt & reflectime <= t(end) - dt
            [~, tinds] = sort(abs(t - reflectime));
            tinds = sort(tinds(1 : 4));
            seisnmo(k, l) = interp1(t(tinds), seisdata(tinds, l), ...
                reflectime, 'spline');
        end
    end
end