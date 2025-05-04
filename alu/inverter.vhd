--
-- Entity: inverter 
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/10/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY inverter IS

    PORT (
        input : IN STD_LOGIC;
        output : OUT STD_LOGIC);
END inverter;

ARCHITECTURE structural OF inverter IS

BEGIN

    output <= NOT (input);

END structural;