module input;

immutable INPUT_STR = "-2 4 4 -2 0 -4 -2 0 0 -2 2 4 0 2 0 -2 -2 2 0 2 -2 -2 0 -2 0 2 0 0 -2 0 0 0 2 -2 0 2 -2 2 0 4 0 -2 0 -2 0 2 -2 2 2 -2 -2 0 0 2 -2 0 -2 0 4 4 0 0 -2 2 0 -4 -4 -2 -4 -4 2 0 2 2 0 0 2 2 2 0 -2 2 0 2 0 0 0 -4 -2 0 2 4 -2 -2 -4 0 2 -4 2 0 0 2 -2 0 0 0 4 -2 2 2 0 2 2 -4 0 0 0 0 -2 2 -2 -2 -2 0 2 2 -2 -2 -2 0 0 4 -4 2 0 0 0 0 0 -4 0 0 2 2 0 0 2 -2 -2 4 4 2 0 0 -4 -2 0 0 0 2 -4 -2 0 0 2 0 4 0 2 2 2 -2 2 -2 2 -2 -2 -2 -4 -4 -2 4 -2 2 -2 -2 0 0 2 -2 2 2 0 0 2 2 2 2 0 0 -2 -2 -2 2 -2 0 2 -2 -2 -4 2 -2 0 0 2 0 -4 2 0 -2 0 2 -2 0 -2 0 0 -2 -2 -2 -4 0 0 -4 0 4 0 0 -2 2 2 2 -2 4 -4 -2 4 0 2 -2 0 0 2 -2 2 0 2 2 0 0 -2 2 0 -2 0 0 0 -2 0 0 0 4 0 2 2 0 0 0 -2 -4 -2 -2 2 0 0 -2 2 2 0 0 -2 2 2 -2 0 -2 4 -2 0 0 -2 -2 2 2 0 0 2 2 -4 2 0 0 4 0 0 2 0 2 2 0 0 -2 0 2 2 2 0 2 2 -2 0 -2 2 -2 -2 -2 0 0 2 -2 0 -2 4 0 2 0 4 -2 -2 -2 -2 2 -2 2 2 4 4 2 2 0 -2 -2 2 2 0 4 -2 -2 4 2 -2 2 0 2 -2 0 2 -2 -2 0 -2 0 2 -2 4 2 0 0 -2 2 0 -2 -2 -2 0 -2 -2 -2 2 2 0 0 0 2 -2 0 0 2 -2 0 0 2 -2 -2 2 2 0 -2 0 -4 2 0 0 2 -2 -2 0 0 2 2 2 2 2 2 2 2 4 0 -2 -2 4 -2 0 -2 2 0 0 4 2 -2 0 0 2 0 0 2 4 4 0 4 -2 0 2 0 2 0 2 -2 -2 2 2 -2 -4 0 -2 0 0 4 -4 0 0 0 2 4 0 0 0 2 -2 0 2 -2 2 0 0 -4 4 -2 2 -2 2 2 0 0 0 2 2 2 0 -2 2 2 0 2 -2 -2 4 -2 -4 0 0 -4 0 2 2 -2 -2 0 -2 -2 2 4 -4 4 2 0 0 -2 2 0 2 2 -4 -2 0 2 2 -2 2 -2 0 0 -2 0 4 0 -2 4 0 0 4 -4 0 -4 -4 0 -2 0 0 2 2 2 2 -2 0 -2 -4 0 0 -2 -2 2 -2 2 -4 0 -4 0 -2 -2 0 -2 -2 2 -4 -2 2 -2 -2 2 2 4 -2 -4 2 2 -4 2 2 0 4 2 -2 -2 0 -2 2 2 2 2 -4 -2 0 -2 0 -4 -2 -2 -2 -2 0 -2 -2 -2 -2 0 0 -2 -4 -2 -2 0 0 -2 0 -2 -2 0 -2 2 0 2 -2 4 -2 0 4 -2 0 2 2 -2 0 -4 0 0 2 0 0 -2 0 -2 -2 2 0 2 2 -2 0 -2 2 0 0 4 0 0 -4 -4 4 -2 -2 0 4 -2 -2 4 0 -2 0 0 4 0 0 -4 -2 -2 0 0 2 0 0 2 -2 -4 0 4 0 0 0 0 0 -2 0 0 -2 -2 2 -2 -2 0 0 2 0 -2 2 -2 4 -2 4 -2 2 0 0 4 0 -4 0 0 -2 0 0 0 0 -2 0 4 2 0 0 2 -2 -2 -2 -2 2 0 -2 0 0 -2 0 2 0 2 -4 0 -2 0 2 2 -4 0 2 2 0 2 0 -4 4 -4 0 2 4 0 2 0 2 0 0 -4 -2 0 2 0 2 2 -2 0 4 4 -4 2 -2 -4 0 -4 0 4 0 0 0 0 0 -2 2 -2 0 0 0 0 2 2 -2 0 0 4 4 -2 -2 -2 -2 0 -2 2 0 4 0 2 2 4 0 0 4 2 4 0 0 -2 0 2 0 0 2 0 0 4 4 0 0 2 0 0 2 -2 0 2 2 2 0 0 -4 -2 0 2 0 -2 0 -2 0 -4 0 0 2 4 0 0 -2 -2 -4 2 0 -2 0 2 2 0 -2 2 0 -2 0 0 -2 -2 -2 0 -2 -4 4 0 4 0 0 0 -4 -4 0 2 0 -2 -4 2 -2 -2 0 2 0 2 0 0 2 -2 -2 0 0 0 -2 0 2 0 0 0 2 -2 -2 2 -4 -2 2 2 -4 4 0 -2 0 0 0 0 0 -4 2 -4 0 -4 0 0 4 2 -2 2 2 2 -2 -2 0 -2 -2 -2 2 0 -2 -2 -2 2 4 2 0 2 -2 -2 0 2 -2 2 0 -2 -2 0 0 -2 0 -2 2 0 0 2 0 0 2 4 0 0 0"; 

immutable PARSED_VALS = [-2, 4, 4, -2, 0, -4, -2, 0, 0, -2, 2, 4, 0, 2, 0, -2, -2, 2, 0, 2, -2, -2, 0, -2, 0, 2, 0, 0, -2, 0, 0, 0, 2, -2, 0, 2, -2, 2, 0, 4, 0, -2, 0, -2, 0, 2, -2, 2, 2, -2, -2, 0, 0, 2, -2, 0, -2, 0, 4, 4, 0, 0, -2, 2, 0, -4, -4, -2, -4, -4, 2, 0, 2, 2, 0, 0, 2, 2, 2, 0, -2, 2, 0, 2, 0, 0, 0, -4, -2, 0, 2, 4, -2, -2, -4, 0, 2, -4, 2, 0, 0, 2, -2, 0, 0, 0, 4, -2, 2, 2, 0, 2, 2, -4, 0, 0, 0, 0, -2, 2, -2, -2, -2, 0, 2, 2, -2, -2, -2, 0, 0, 4, -4, 2, 0, 0, 0, 0, 0, -4, 0, 0, 2, 2, 0, 0, 2, -2, -2, 4, 4, 2, 0, 0, -4, -2, 0, 0, 0, 2, -4, -2, 0, 0, 2, 0, 4, 0, 2, 2, 2, -2, 2, -2, 2, -2, -2, -2, -4, -4, -2, 4, -2, 2, -2, -2, 0, 0, 2, -2, 2, 2, 0, 0, 2, 2, 2, 2, 0, 0, -2, -2, -2, 2, -2, 0, 2, -2, -2, -4, 2, -2, 0, 0, 2, 0, -4, 2, 0, -2, 0, 2, -2, 0, -2, 0, 0, -2, -2, -2, -4, 0, 0, -4, 0, 4, 0, 0, -2, 2, 2, 2, -2, 4, -4, -2, 4, 0, 2, -2, 0, 0, 2, -2, 2, 0, 2, 2, 0, 0, -2, 2, 0, -2, 0, 0, 0, -2, 0, 0, 0, 4, 0, 2, 2, 0, 0, 0, -2, -4, -2, -2, 2, 0, 0, -2, 2, 2, 0, 0, -2, 2, 2, -2, 0, -2, 4, -2, 0, 0, -2, -2, 2, 2, 0, 0, 2, 2, -4, 2, 0, 0, 4, 0, 0, 2, 0, 2, 2, 0, 0, -2, 0, 2, 2, 2, 0, 2, 2, -2, 0, -2, 2, -2, -2, -2, 0, 0, 2, -2, 0, -2, 4, 0, 2, 0, 4, -2, -2, -2, -2, 2, -2, 2, 2, 4, 4, 2, 2, 0, -2, -2, 2, 2, 0, 4, -2, -2, 4, 2, -2, 2, 0, 2, -2, 0, 2, -2, -2, 0, -2, 0, 2, -2, 4, 2, 0, 0, -2, 2, 0, -2, -2, -2, 0, -2, -2, -2, 2, 2, 0, 0, 0, 2, -2, 0, 0, 2, -2, 0, 0, 2, -2, -2, 2, 2, 0, -2, 0, -4, 2, 0, 0, 2, -2, -2, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 4, 0, -2, -2, 4, -2, 0, -2, 2, 0, 0, 4, 2, -2, 0, 0, 2, 0, 0, 2, 4, 4, 0, 4, -2, 0, 2, 0, 2, 0, 2, -2, -2, 2, 2, -2, -4, 0, -2, 0, 0, 4, -4, 0, 0, 0, 2, 4, 0, 0, 0, 2, -2, 0, 2, -2, 2, 0, 0, -4, 4, -2, 2, -2, 2, 2, 0, 0, 0, 2, 2, 2, 0, -2, 2, 2, 0, 2, -2, -2, 4, -2, -4, 0, 0, -4, 0, 2, 2, -2, -2, 0, -2, -2, 2, 4, -4, 4, 2, 0, 0, -2, 2, 0, 2, 2, -4, -2, 0, 2, 2, -2, 2, -2, 0, 0, -2, 0, 4, 0, -2, 4, 0, 0, 4, -4, 0, -4, -4, 0, -2, 0, 0, 2, 2, 2, 2, -2, 0, -2, -4, 0, 0, -2, -2, 2, -2, 2, -4, 0, -4, 0, -2, -2, 0, -2, -2, 2, -4, -2, 2, -2, -2, 2, 2, 4, -2, -4, 2, 2, -4, 2, 2, 0, 4, 2, -2, -2, 0, -2, 2, 2, 2, 2, -4, -2, 0, -2, 0, -4, -2, -2, -2, -2, 0, -2, -2, -2, -2, 0, 0, -2, -4, -2, -2, 0, 0, -2, 0, -2, -2, 0, -2, 2, 0, 2, -2, 4, -2, 0, 4, -2, 0, 2, 2, -2, 0, -4, 0, 0, 2, 0, 0, -2, 0, -2, -2, 2, 0, 2, 2, -2, 0, -2, 2, 0, 0, 4, 0, 0, -4, -4, 4, -2, -2, 0, 4, -2, -2, 4, 0, -2, 0, 0, 4, 0, 0, -4, -2, -2, 0, 0, 2, 0, 0, 2, -2, -4, 0, 4, 0, 0, 0, 0, 0, -2, 0, 0, -2, -2, 2, -2, -2, 0, 0, 2, 0, -2, 2, -2, 4, -2, 4, -2, 2, 0, 0, 4, 0, -4, 0, 0, -2, 0, 0, 0, 0, -2, 0, 4, 2, 0, 0, 2, -2, -2, -2, -2, 2, 0, -2, 0, 0, -2, 0, 2, 0, 2, -4, 0, -2, 0, 2, 2, -4, 0, 2, 2, 0, 2, 0, -4, 4, -4, 0, 2, 4, 0, 2, 0, 2, 0, 0, -4, -2, 0, 2, 0, 2, 2, -2, 0, 4, 4, -4, 2, -2, -4, 0, -4, 0, 4, 0, 0, 0, 0, 0, -2, 2, -2, 0, 0, 0, 0, 2, 2, -2, 0, 0, 4, 4, -2, -2, -2, -2, 0, -2, 2, 0, 4, 0, 2, 2, 4, 0, 0, 4, 2, 4, 0, 0, -2, 0, 2, 0, 0, 2, 0, 0, 4, 4, 0, 0, 2, 0, 0, 2, -2, 0, 2, 2, 2, 0, 0, -4, -2, 0, 2, 0, -2, 0, -2, 0, -4, 0, 0, 2, 4, 0, 0, -2, -2, -4, 2, 0, -2, 0, 2, 2, 0, -2, 2, 0, -2, 0, 0, -2, -2, -2, 0, -2, -4, 4, 0, 4, 0, 0, 0, -4, -4, 0, 2, 0, -2, -4, 2, -2, -2, 0, 2, 0, 2, 0, 0, 2, -2, -2, 0, 0, 0, -2, 0, 2, 0, 0, 0, 2, -2, -2, 2, -4, -2, 2, 2, -4, 4, 0, -2, 0, 0, 0, 0, 0, -4, 2, -4, 0, -4, 0, 0, 4, 2, -2, 2, 2, 2, -2, -2, 0, -2, -2, -2, 2, 0, -2, -2, -2, 2, 4, 2, 0, 2, -2, -2, 0, 2, -2, 2, 0, -2, -2, 0, 0, -2, 0, -2, 2, 0, 0, 2, 0, 0, 2, 4, 0, 0, 0]; 