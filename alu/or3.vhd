--
-- Entity: or3
-- Architecture : structural
-- Author: cpatel2
-- Created On: 11/11/2003
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY or3 IS

  PORT (
    input1 : IN STD_LOGIC;
    input2 : IN STD_LOGIC;
    input3 : IN STD_LOGIC;
    output : OUT STD_LOGIC);
END or3;

ARCHITECTURE structural OF or3 IS

BEGIN

  output <= input3 OR input2 OR input1;

END structural;