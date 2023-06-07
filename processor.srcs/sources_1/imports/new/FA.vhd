----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 08:22:53 AM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_IN : in STD_LOGIC;
           SUM : out STD_LOGIC;
           C_OUT : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

component HA
    PORT(A,B : IN STD_LOGIC;
        C_OUT,SUM : OUT STD_LOGIC
        );
end component;

SIGNAL HA_1_C_OUT,HA_1_SUM,HA_2_COUT : STD_LOGIC;

     

begin

HA_0:HA 
    PORT MAP(
        A =>A,
        B=>B,
        C_OUT=>HA_1_C_OUT,
        SUM=>HA_1_SUM
        );
        
 HA_1:HA 
    PORT MAP(
        A =>HA_1_SUM,
        B=>C_IN,
        C_OUT=>HA_2_COUT,
        SUM=>SUM
        );
    
C_OUT <= HA_1_C_OUT OR HA_2_COUT;

end Behavioral;
