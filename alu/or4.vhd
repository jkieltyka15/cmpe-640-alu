--
-- Entity: or4 
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/10/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY or4 IS

  PORT (
    input1 : IN STD_LOGIC;
    input2 : IN STD_LOGIC;
    input3 : IN STD_LOGIC;
    input4 : IN STD_LOGIC;
    output : OUT STD_LOGIC);
END or4;

ARCHITECTURE structural OF or4 IS

BEGIN

  output <= input4 OR input3 OR input2 OR input1;

END structural;