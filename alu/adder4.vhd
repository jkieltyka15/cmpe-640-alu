--
-- Entity: adder4
-- Architecture : structural
-- Author: cpatel2
-- Created On: 10/21/2004
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY adder4 IS

  PORT (
    input1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    input2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    carryin : IN STD_LOGIC;
    sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    carryout : OUT STD_LOGIC);
END adder4;

ARCHITECTURE structural OF adder4 IS

  COMPONENT adder1
    PORT (
      input1 : IN STD_LOGIC;
      input2 : IN STD_LOGIC;
      carryin : IN STD_LOGIC;
      sum : OUT STD_LOGIC;
      carryout : OUT STD_LOGIC);
  END COMPONENT;

  FOR adder1_1, adder1_2, adder1_3, adder1_4 : adder1 USE ENTITY work.adder1(structural);

  SIGNAL ctemp : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN

  adder1_1 : adder1 PORT MAP(input1(0), input2(0), carryin, sum(0), ctemp(0));
  adder1_2 : adder1 PORT MAP(input1(1), input2(1), ctemp(0), sum(1), ctemp(1));
  adder1_3 : adder1 PORT MAP(input1(2), input2(2), ctemp(1), sum(2), ctemp(2));
  adder1_4 : adder1 PORT MAP(input1(3), input2(3), ctemp(2), sum(3), carryout);

END structural;