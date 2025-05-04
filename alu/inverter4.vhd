--
-- Entity: inverter4
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/14/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY inverter4 IS

    PORT (
        input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END inverter4;

ARCHITECTURE structural OF inverter4 IS

    COMPONENT inverter
        PORT (
        input : IN STD_LOGIC;
        output : OUT STD_LOGIC);
    END COMPONENT;

    FOR inverter_0, inverter_1, inverter_2, inverter_3 : inverter USE ENTITY work.inverter(structural);

BEGIN

    inverter_0 : inverter PORT MAP(input(0), output(0));
    inverter_1 : inverter PORT MAP(input(1), output(1));
    inverter_2 : inverter PORT MAP(input(2), output(2));
    inverter_3 : inverter PORT MAP(input(3), output(3));

END structural;