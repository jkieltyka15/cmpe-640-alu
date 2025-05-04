--
-- Entity: alu_4 
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 9/15/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY alu_4 IS
    PORT (
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin : IN STD_LOGIC;
        S0 : IN STD_LOGIC;
        S1 : IN STD_LOGIC;
        G : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout : OUT STD_LOGIC);
END alu_4;

ARCHITECTURE structural OF alu_4 IS

    COMPONENT ybox
        PORT (
            b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            s0 : IN STD_LOGIC;
            s1 : IN STD_LOGIC;
            y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT adder4
        PORT (
            input1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            input2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            carryin : IN STD_LOGIC;
            sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            carryout : OUT STD_LOGIC);
    END COMPONENT;

    FOR ybox_0 : ybox USE ENTITY work.ybox(structural);
    FOR adder4_0 : adder4 USE ENTITY work.adder4(structural);

    SIGNAL y : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    ybox_0 : ybox PORT MAP(B, S0, S1, y);
    adder4_0 : adder4 PORT MAP(A, y, Cin, G, Cout);

END structural;