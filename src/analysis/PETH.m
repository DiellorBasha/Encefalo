function [time, peth] = PETH(eventChannel, spikeTimes, samplingRate, windowSize, binSize)
% PETH - Computes the peri-event histogram of spike times relative to a set
% of events.
%
%   [time, peth] = PETH(eventChannel, spikeTimes, samplingRate, windowSize, binSize)
%
%   Input:
%       eventChannel    - A vector of event times in seconds.
%       spikeTimes      - A vector of spike times in seconds.
%       samplingRate    - Sampling rate in Hz.
%       windowSize      - Window size in seconds to consider around each
%                         event.
%       binSize         - Bin size in seconds for the histogram.
%
%   Output:
%       time            - A vector of time values in seconds for the center
%                         of each histogram bin.
%       peth            - A vector of spike counts for each histogram bin.
%
%   Example:
%       % Generate some sample data
%       samplingRate = 1000; % Sampling rate
%       nEvents = 100;
%       nSpikes = 500;
%       eventChannel = sort(rand(nEvents, 1) * 300);
%       spikeTimes = sort(rand(nSpikes, 1) * 300);
%
%       % Compute the peri-event histogram
%       windowSize = 2; % seconds
%       binSize = 0.1; % seconds
%       [time, peth] = PETH(eventChannel, spikeTimes, samplingRate, windowSize, binSize);
%       plot(time, peth);
%

% Convert window size and bin size to number of samples
windowSizeSamples = round(windowSize * samplingRate);
binSizeSamples = round(binSize * samplingRate);

% Initialize peri-event histogram
nBins = round(windowSizeSamples / binSizeSamples);
peth = zeros(1, nBins);

% Loop through events and calculate peri-event histogram for spike channel
for i = 1:length(eventChannel)
    startTime = eventChannel(i) - windowSizeSamples / 2 / samplingRate;
    endTime = eventChannel(i) + windowSizeSamples / 2 / samplingRate;
    
    % Get the spike times that occur within the window, centered to eventChannel
    spikeData = spikeTimes(spikeTimes >= startTime & spikeTimes <= endTime);
    
    % Calculate bin edges 
    binEdges = linspace(startTime, endTime, nBins + 1);
    
    % Use histcounts to get bin indices
    counts = histcounts(spikeData, binEdges);
    
    % Accumulate histogram
    peth = peth + counts;
end

% Normalize peri-event histogram to get rate
peth = peth / length(eventChannel) / binSize;

% Compute bin centers in seconds
time = linspace(-windowSize / 2, windowSize / 2 - binSize, nBins) + binSize / 2;

end
