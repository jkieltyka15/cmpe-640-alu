--
-- Entity: nibblemux4to1
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/12/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY nibblemux4to1 IS

    PORT (
        s0 : IN STD_LOGIC;
        s1 : IN STD_LOGIC;
        input1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        input2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        input3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        input4 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END nibblemux4to1;

ARCHITECTURE structural OF nibblemux4to1 IS

    COMPONENT mux4to1
        PORT (
            s0 : IN STD_LOGIC;
            s1 : IN STD_LOGIC;
            input1 : IN STD_LOGIC;
            input2 : IN STD_LOGIC;
            input3 : IN STD_LOGIC;
            input4 : IN STD_LOGIC;
            output : OUT STD_LOGIC);
    END COMPONENT;

    FOR mux4to1_0, mux4to1_1, mux4to1_2, mux4to1_3 : mux4to1 USE ENTITY work.mux4to1(structural);

BEGIN

    mux4to1_0 : mux4to1 PORT MAP(s0, s1, input1(0), input2(0), input3(0), input4(0), output(0));
    mux4to1_1 : mux4to1 PORT MAP(s0, s1, input1(1), input2(1), input3(1), input4(1), output(1));
    mux4to1_2 : mux4to1 PORT MAP(s0, s1, input1(2), input2(2), input3(2), input4(2), output(2));
    mux4to1_3 : mux4to1 PORT MAP(s0, s1, input1(3), input2(3), input3(3), input4(3), output(3));

END structural;