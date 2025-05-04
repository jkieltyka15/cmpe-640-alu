--
-- Entity: alu_4_test 
-- Architecture : test 
-- Author: jkielty1
-- Created On: 9/15/2023
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_textio.ALL;
USE STD.textio.ALL;

ENTITY alu_4_test IS

END alu_4_test;

ARCHITECTURE test OF alu_4_test IS

  COMPONENT alu_4
    PORT (
      A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      Cin : IN STD_LOGIC;
      S0 : IN STD_LOGIC;
      S1 : IN STD_LOGIC;
      G : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      Cout : OUT STD_LOGIC);
  END COMPONENT;

  FOR alu_4_0 : alu_4 USE ENTITY work.alu_4(structural);
  SIGNAL A, B, G : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL Cin, S0, S1, Cout : STD_LOGIC;
  SIGNAL clock : STD_LOGIC;

BEGIN

  alu_4_0 : alu_4 PORT MAP(A, B, Cin, S0, S1, G, Cout);

  clk : PROCESS
  BEGIN -- process clk

    clock <= '0', '1' AFTER 5 ns;
    WAIT FOR 10 ns;

  END PROCESS clk;

  io_process : PROCESS

    FILE infile : text IS IN "alu_4_in.txt";
    FILE outfile : text IS OUT "alu_4_out.txt";
    VARIABLE a_v, b_v, g_v : STD_LOGIC_VECTOR(3 DOWNTO 0);
    VARIABLE cin_v, s0_v, s1_v, cout_v : STD_LOGIC;
    VARIABLE buf : line;

  BEGIN

    WHILE NOT (endfile(infile)) LOOP
      readline(infile, buf);
      read (buf, a_v);
      A <= a_v;

      readline(infile, buf);
      read (buf, b_v);
      B <= b_v;

      readline(infile, buf);
      read (buf, cin_v);
      Cin <= cin_v;

      readline(infile, buf);
      read (buf, s0_v);
      S0 <= s0_v;

      readline(infile, buf);
      read (buf, s1_v);
      S1 <= s1_v;

      WAIT UNTIL falling_edge(clock);

      g_v := G;
      cout_v := Cout;

      write(buf, g_v);
      writeline(outfile, buf);

      write(buf, cout_v);
      writeline(outfile, buf);

    END LOOP;

  END PROCESS io_process;

END test;