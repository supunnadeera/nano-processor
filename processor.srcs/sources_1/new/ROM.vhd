----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2023 18:21:36
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
 
 signal ROM_array : rom_type := (
        --mov r1 001
         "101110000001",
         --mov r2 001
         "111100000001",
         --add r1 , r2
         "100110100010",
         --mov r1 001
         "100110100000",
         --mov r1 001
         "100110100011",
         --mov r1 001
         "100110100000",
         --mov r1 001
         "100010000001",
         --mov r1 001
         "100010000111"
          );

begin
   data <= ROM_array(to_integer(unsigned(address)));  
   
end Behavioral;
