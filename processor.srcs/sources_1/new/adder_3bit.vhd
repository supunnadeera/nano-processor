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

entity adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
--           C_OUT : out STD_LOGIC; --overflow
           SUM : out STD_LOGIC_VECTOR (2 downto 0)          
           );           
end adder_3bit;

architecture Behavioral of adder_3bit is

component FA
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C_IN : in STD_LOGIC;
       SUM : out STD_LOGIC;
       C_OUT : out STD_LOGIC);
 end component;
 
 SIGNAL FA0_COUT,FA1_COUT,FA2_COUT:STD_LOGIC;
 SIGNAL C_out_sub_temp,C_out_sub,C_in_sub:STD_LOGIC;

begin

FA0 : FA
    PORT MAP(
    A=>A(0),
    B=>B(0),
    C_IN=>'0',
    SUM=>SUM(0),
    C_OUT=>FA0_COUT
    );
FA1 : FA
    PORT MAP(
    A=>A(1),
    B=>B(1),
    C_IN=>FA0_COUT,
    SUM=>SUM(1),
    C_OUT=>FA1_COUT
    );
FA2 : FA
    PORT MAP(
    A=>A(2),
    B=>B(2),
    C_IN=>FA1_COUT,
    SUM=>SUM(2),
    C_OUT=>FA2_COUT
    );
--C_out_sub_temp <= C_out_sub;
--C_OUT<=C_out_sub_temp XOR FA2_COUT;
--C_in_sub<= SUB XOR C
end Behavioral;
