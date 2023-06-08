----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:20:03 AM
-- Design Name: 
-- Module Name: register_bank - Behavioral
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

entity register_bank is
    Port ( clock : in STD_LOGIC;
           register_en : in STD_LOGIC_VECTOR (2 downto 0);
           data_in : in STD_LOGIC_VECTOR (3 downto 0);
           out_R0 : out STD_LOGIC_VECTOR (3 downto 0);
           out_R1 : out STD_LOGIC_VECTOR (3 downto 0);
           out_R2 : out STD_LOGIC_VECTOR (3 downto 0);
           out_R3 : out STD_LOGIC_VECTOR (3 downto 0);
           out_R4 : out STD_LOGIC_VECTOR (3 downto 0);
           out_R5 : out STD_LOGIC_VECTOR (3 downto 0);
           out_R6 : out STD_LOGIC_VECTOR (3 downto 0);          
           out_R7 : out STD_LOGIC_VECTOR (3 downto 0)
           
           );
end register_bank;



architecture Behavioral of register_bank is

COMPONENT REG is
    Port ( data_in : in STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (3 downto 0);
           reset : in STD_LOGIC;
           en : in STD_LOGIC;
           clock: in STD_LOGIC);
end COMPONENT;

COMPONENT Decoder_3_to_8 is

 Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

SIGNAL register_selection:STD_LOGIC_VECTOR (7 downto 0);
--SIGNAL register_selection:STD_LOGIC_VECTOR (7 downto 0):="00000001";

begin

Decoder_3_to_80 : Decoder_3_to_8
    PORT MAP(
        I=>register_en,
        EN=>'1',
        Y=>register_selection
    );
    
REG0:REG
    Port MAP( data_in=> "0000",
           data_out=>out_R0,
           reset=> '0' ,
           en=>register_selection(0),
           clock=>clock
           );

REG1:REG
    Port MAP( data_in=> data_in,
           data_out=>out_R1,
           reset=> '0' ,
           en=>register_selection(1),
           clock=>clock
           );
           
REG2:REG
  Port MAP( data_in=> data_in,
         data_out=>out_R2,
         reset=> '0' ,
         en=>register_selection(2),
         clock=>clock
         );   

REG3:REG
  Port MAP( data_in=> data_in,
         data_out=>out_R3,
         reset=> '0' ,
         en=>register_selection(3),
         clock=>clock
         );   

REG4:REG
  Port MAP( data_in=> data_in,
         data_out=>out_R4,
         reset=> '0' ,
         en=>register_selection(4),
         clock=>clock
         );   

REG5:REG
  Port MAP( data_in=> data_in,
         data_out=>out_R5,
         reset=> '0' ,
         en=>register_selection(5),
         clock=>clock
         );  

REG6:REG
  Port MAP( data_in=> data_in,
         data_out=>out_R6,
         reset=> '0' ,
         en=>register_selection(6),
         clock=>clock
         );   

REG7:REG
  Port MAP( data_in=> data_in,
         data_out=>out_R7,
         reset=> '0' ,
         en=>register_selection(7),
         clock=>clock
         );     
           

end Behavioral;
