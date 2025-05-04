--
-- Entity: and3
-- Architecture : structural
-- Author: jkielty1
-- Created On: 9/10/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY and3 IS

  PORT (
    input1 : IN STD_LOGIC;
    input2 : IN STD_LOGIC;
    input3 : IN STD_LOGIC;
    output : OUT STD_LOGIC);
END and3;

ARCHITECTURE structural OF and3 IS

BEGIN

  output <= input3 AND input2 AND input1;

END structural;