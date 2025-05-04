--
-- Entity: ybox 
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/14/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ybox IS

    PORT (
        b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        s0 : IN STD_LOGIC;
        s1 : IN STD_LOGIC;
        y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ybox;

ARCHITECTURE structural OF ybox IS

    COMPONENT zerogenerator4
        PORT (
            output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT onegenerator4
        PORT (
            output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT inverter4
        PORT (
            input : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT nibblemux4to1
        PORT (
            s0 : IN STD_LOGIC;
            s1 : IN STD_LOGIC;
            input1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            input2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            input3 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            input4 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    FOR zerogenerator4_0 : zerogenerator4 USE ENTITY work.zerogenerator4(structural);
    FOR inverter4_0 : inverter4 USE ENTITY work.inverter4(structural);
    FOR onegenerator4_0 : onegenerator4 USE ENTITY work.onegenerator4(structural);
    FOR nibblemux4to1_0 : nibblemux4to1 USE ENTITY work.nibblemux4to1(structural);

    SIGNAL mux_in_0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL mux_in_2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL mux_in_3 : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    zerogenerator4_0 : zerogenerator4 PORT MAP(mux_in_0);
    inverter4_0 : inverter4 PORT MAP(b, mux_in_2);
    onegenerator4_0 : onegenerator4 PORT MAP(mux_in_3);
    nibblemux4to1_0 : nibblemux4to1 PORT MAP(s0, s1, mux_in_0, b, mux_in_2, mux_in_3, y);

END structural;