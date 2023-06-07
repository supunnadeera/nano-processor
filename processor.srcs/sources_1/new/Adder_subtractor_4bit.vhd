----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 08:59:33 AM
-- Design Name: 
-- Module Name: RCA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_subtractor_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SUM : out STD_LOGIC_VECTOR (3 downto 0);
           C_OUT : out STD_LOGIC; --overflow
           C_IN : in STD_LOGIC;
           Zero: out STD_LOGIC;
           SUB : in STD_LOGIC);
           
end Adder_subtractor_4bit;

architecture Behavioral of Adder_subtractor_4bit is

component FA
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C_IN : in STD_LOGIC;
       SUM : out STD_LOGIC;
       C_OUT : out STD_LOGIC);
 end component;
 
 SIGNAL FA0_COUT,FA1_COUT,FA2_COUT:STD_LOGIC;
 SIGNAL B0,B1,B2,B3,C_out_sub_temp,C_out_sub,C_in_sub:STD_LOGIC;

begin

FA0 : FA
    PORT MAP(
    A=>A(0),
    B=>B0,
    C_IN=>C_in_sub,
    SUM=>SUM(0),
    C_OUT=>FA0_COUT
    );
FA1 : FA
    PORT MAP(
    A=>A(1),
    B=>B1,
    C_IN=>FA0_COUT,
    SUM=>SUM(1),
    C_OUT=>FA1_COUT
    );
FA2 : FA
    PORT MAP(
    A=>A(2),
    B=>B2,
    C_IN=>FA1_COUT,
    SUM=>SUM(2),
    C_OUT=>FA2_COUT
    );
FA3 : FA
    PORT MAP(
    A=>A(3),
    B=>B3,
    C_IN=>FA2_COUT,
    SUM=>SUM(3),
    C_OUT=>C_out_sub
    
    );
   
B0<=B(0) XOR SUB;
B1<=B(1) XOR SUB;
B2<=B(2) XOR SUB;
B3<=B(3) XOR SUB;


C_in_sub <= SUB XOR C_IN;
C_OUT <= C_out_sub XOR SUB;
Zero<='0';

--C_out_sub_temp <= C_out_sub;
--C_OUT<=C_out_sub_temp XOR FA2_COUT;
--C_in_sub<= SUB XOR C
end Behavioral;
