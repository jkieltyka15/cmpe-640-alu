--
-- Entity: adder1
-- Architecture : structural
-- Author: cpatel2
-- Created On: 10/21/2004
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY adder1 IS

  PORT (
    input1 : IN STD_LOGIC;
    input2 : IN STD_LOGIC;
    carryin : IN STD_LOGIC;
    sum : OUT STD_LOGIC;
    carryout : OUT STD_LOGIC);
END adder1;

ARCHITECTURE structural OF adder1 IS

  COMPONENT xor2
    PORT (
      input1 : IN STD_LOGIC;
      input2 : IN STD_LOGIC;
      output : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT and2
    PORT (
      input1 : IN STD_LOGIC;
      input2 : IN STD_LOGIC;
      output : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT or3
    PORT (
      input1 : IN STD_LOGIC;
      input2 : IN STD_LOGIC;
      input3 : IN STD_LOGIC;
      output : OUT STD_LOGIC);
  END COMPONENT;
  
  FOR xor2_1, xor2_2 : xor2 USE ENTITY work.xor2(structural);
  FOR and2_1, and2_2, and2_3 : and2 USE ENTITY work.and2(structural);
  FOR or3_1 : or3 USE ENTITY work.or3(structural);

  SIGNAL temp1, temp2, temp3, temp4 : STD_LOGIC;

BEGIN

  xor2_1 : xor2 PORT MAP(input1, input2, temp1);
  xor2_2 : xor2 PORT MAP(carryin, temp1, sum);

  and2_1 : and2 PORT MAP(input1, input2, temp2);
  and2_2 : and2 PORT MAP(input1, carryin, temp3);
  and2_3 : and2 PORT MAP(input2, carryin, temp4);

  or3_1 : or3 PORT MAP(temp2, temp3, temp4, carryout);

END structural;