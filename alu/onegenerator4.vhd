--
-- Entity: onegenerator4
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/14/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY onegenerator4 IS

  PORT (
    output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END onegenerator4;

ARCHITECTURE structural OF onegenerator4 IS

BEGIN

  output <= "1111";

END structural;