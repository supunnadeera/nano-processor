----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 11:27:59 AM
-- Design Name: 
-- Module Name: TB_processor - Behavioral
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

entity TB_processor is
--  Port ( );
end TB_processor;

architecture Behavioral of TB_processor is



COMPONENT processor is
    Port ( 
    Clock : in STD_LOGIC;
    temp_out_R0 : out STD_LOGIC_VECTOR (3 downto 0);
        temp_out_R1 : out STD_LOGIC_VECTOR (3 downto 0);
    temp_out_R2 : out STD_LOGIC_VECTOR (3 downto 0);
    temp_out_R3 : out STD_LOGIC_VECTOR (3 downto 0);
    temp_out_R4 : out STD_LOGIC_VECTOR (3 downto 0);
    temp_out_R5 : out STD_LOGIC_VECTOR (3 downto 0);
    temp_out_R6 : out STD_LOGIC_VECTOR (3 downto 0);          
    temp_out_R7 : out STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC);
end COMPONENT;


signal Clk : std_logic := '0';
signal Res : std_logic := '0';
SIGNAL R0_out,R1_out,R2_out,R3_out,R4_out,R5_out,R6_out,R7_out : STD_LOGIC_VECTOR (3 downto 0);


begin

UUT:processor
    Port MAP( 
        Clock =>Clk,
        temp_out_R0 =>R0_out,  
        temp_out_R1 =>R1_out,  
        temp_out_R2 =>R2_out,  
        temp_out_R3 =>R3_out,  
        temp_out_R4 =>R4_out,  
        temp_out_R5 =>R5_out,  
        temp_out_R6 =>R6_out,            
        temp_out_R7 =>R7_out,  
       Reset=> '0'
       );
       
    process
   begin
       wait for 50ns;
       Clk <= not Clk;
   end process;

    process
        begin


            wait;
    end process;

end Behavioral;
