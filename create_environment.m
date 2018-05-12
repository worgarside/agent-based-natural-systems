function create_environment(size)

% function that populates the global data structure representing
% environmental information

global ENV_DATA

ENV_DATA.shape = 'square';      % shape of environment - FIXED AS SQUARE
ENV_DATA.units = 'kilometres';  % FIXED AS KM
ENV_DATA.size = size;           % length of environment edge in km