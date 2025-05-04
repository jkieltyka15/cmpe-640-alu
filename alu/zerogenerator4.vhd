--
-- Entity: zerogenerator4
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/10/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY zerogenerator4 IS

  PORT (
    output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END zerogenerator4;

ARCHITECTURE structural OF zerogenerator4 IS

BEGIN

  output <= "0000";

END structural;