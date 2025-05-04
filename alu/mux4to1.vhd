--
-- Entity: mux4to1
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/10/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux4to1 IS

    PORT (
        s0 : IN STD_LOGIC;
        s1 : IN STD_LOGIC;
        input1 : IN STD_LOGIC;
        input2 : IN STD_LOGIC;
        input3 : IN STD_LOGIC;
        input4 : IN STD_LOGIC;
        output : OUT STD_LOGIC);
END mux4to1;

ARCHITECTURE structural OF mux4to1 IS

    COMPONENT inverter
        PORT (
            input : IN STD_LOGIC;
            output : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT and3
        PORT (
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
            input3 : IN STD_LOGIC;
            output : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT or4
        PORT (
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
            input3 : IN STD_LOGIC;
            input4 : IN STD_LOGIC;
            output : OUT STD_LOGIC);
    END COMPONENT;

    FOR inverter_0, inverter_1 : inverter USE ENTITY work.inverter(structural);
    FOR and3_0, and3_1, and3_2, and3_3 : and3 USE ENTITY work.and3(structural);
    FOR or4_0 : or4 USE ENTITY work.or4(structural);

    SIGNAL s0_bar : STD_LOGIC;
    SIGNAL s1_bar : STD_LOGIC;
    SIGNAL and_out : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    inverter_0 : inverter PORT MAP(s0, s0_bar);
    inverter_1 : inverter PORT MAP(s1, s1_bar);

    and3_0 : and3 PORT MAP(s0_bar, s1_bar, input1, and_out(0));
    and3_1 : and3 PORT MAP(s0, s1_bar, input2, and_out(1));
    and3_2 : and3 PORT MAP(s0_bar, s1, input3, and_out(2));
    and3_3 : and3 PORT MAP(s0, s1, input4, and_out(3));

    or4_0 : or4 PORT MAP(and_out(0), and_out(1), and_out(2), and_out(3), output);

END structural;