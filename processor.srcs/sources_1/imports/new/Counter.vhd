----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2023 04:48:50 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

----------------------------------------------------------------------------------
entity Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;
architecture Behavioral of Counter is
COMPONENT D_FF
PORT(
    D : in STD_LOGIC;
    Res : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC;
    Qbar : out STD_LOGIC
);
END COMPONENT;
COMPONENT Slow_Clk
PORT(
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC
);
END COMPONENT;
signal D0, D1, D2 : std_logic;
signal Q0, Q1, Q2 : std_logic;
signal Clk_slow : std_logic;
begin
    Slow_Clk0 : Slow_Clk PORT MAP(
        Clk_in => Clk,
        Clk_out => Clk_slow
    );
    D0 <= ((NOT Q2) and (NOT Dir)) or (Q1 AND Dir);
    D1 <= ((NOT Dir) and Q0) or (Dir and Q2);
    D2 <= ((NOT Dir) and Q1) or (Dir and (NOT Q0));
    D_FF0 : D_FF PORT MAP(
        D => D0,
        Res => Res,
        Clk => Clk_slow,
        Q => Q0
    );
    D_FF1 : D_FF PORT MAP(
        D => D1,
        Res => Res,
        Clk => Clk_slow,
        Q => Q1
    );
    D_FF2 : D_FF PORT MAP(
        D => D2,
        Res => Res,
        Clk => Clk_slow,
        Q => Q2
    );
    Q(0) <= Q0;
    Q(1) <= Q1;
    Q(2) <= Q2;
end Behavioral;
