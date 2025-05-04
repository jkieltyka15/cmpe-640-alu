--
-- Entity: and2
-- Architecture : structural
-- Author: cpatel2
-- Created On: 11/11/2003
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY and2 IS

  PORT (
    input1 : IN STD_LOGIC;
    input2 : IN STD_LOGIC;
    output : OUT STD_LOGIC);
END and2;

ARCHITECTURE structural OF and2 IS

BEGIN

  output <= input2 AND input1;

END structural;