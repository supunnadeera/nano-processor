----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 01:16:27 PM
-- Design Name: 
-- Module Name: REG - Behavioral
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

entity Counter is
    Port ( data_in : in STD_LOGIC_VECTOR (2 downto 0);
           data_out : out STD_LOGIC_VECTOR (2 downto 0);
           reset : in STD_LOGIC;
           clock: in STD_LOGIC);
end Counter;

architecture Behavioral of Counter is
COMPONENT D_FF
    Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
--       Qbar : out STD_LOGIC;
        en: in STD_LOGIC;
       Q : out STD_LOGIC
       
       );
END COMPONENT;

SIGNAL en:STD_LOGIC :='1';

begin
D_FF0 : D_FF 
PORT MAP(
        D=>data_in(0),
        Q=>data_out(0),
        Res=>reset,
--            Qbar =>not data_out(0),
        en=>en,
        Clk=>clock

);
    D_FF1 : D_FF 
PORT MAP(
        D=>data_in(1),
        Q=>data_out(1),
        Res=>reset,
--            Qbar =>not data_out(0),
        en=>en,
        Clk=>clock

);
    D_FF2 : D_FF 
PORT MAP(
        D=>data_in(2),
        Q=>data_out(2),
        Res=>reset,
--            Qbar =>not data_out(0),
        en=>en,
        Clk=>clock

);
end Behavioral;

