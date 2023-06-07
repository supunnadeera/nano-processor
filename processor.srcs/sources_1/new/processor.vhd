----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 06:58:12 AM
-- Design Name: 
-- Module Name: processor - Behavioral
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

entity processor is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC);
end processor;

architecture Behavioral of processor is

COMPONENT ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end COMPONENT;

COMPONENT InstructionDecorder is
    Port(Instruction:in STD_LOGIC_VECTOR(11 downto 0);
         Register_Enable :out STD_LOGIC_VECTOR(2 downto 0);
         Load_Select :out STD_LOGIC;
         Immidiate_Value :out STD_LOGIC_VECTOR(3 downto 0);         
         Register_Select_1 :out STD_LOGIC_VECTOR(2 downto 0);
         Register_Select_2 :out STD_LOGIC_VECTOR(2 downto 0);
         Jump_Flag :out STD_LOGIC;
         Address_to_jump : out STD_LOGIC_VECTOR(2 downto 0);
         --adder 1 , subtractor 2
         Operation : out STD_LOGIC);
         
end COMPONENT;

COMPONENT Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

COMPONENT MUX_2_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           F : out STD_LOGIC_VECTOR (2 downto 0));
           
end COMPONENT;

COMPONENT MUX_2_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       S : in STD_LOGIC;
       F : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;



COMPONENT register_bank is
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
end COMPONENT;

COMPONENT Adder_subtractor_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SUM : out STD_LOGIC_VECTOR (3 downto 0);
           C_OUT : out STD_LOGIC; --overflow
           C_IN : in STD_LOGIC;
           Zero: out STD_LOGIC;
           SUB : in STD_LOGIC);
           
end COMPONENT;

COMPONENT adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
--           C_OUT : out STD_LOGIC; --overflow
           SUM : out STD_LOGIC_VECTOR (2 downto 0)          
           );           
end COMPONENT;

COMPONENT MUX_8_4bit is
    Port ( I_0 : in STD_LOGIC_VECTOR (3 downto 0);
           I_1 : in STD_LOGIC_VECTOR (3 downto 0);
           I_2 : in STD_LOGIC_VECTOR (3 downto 0);
           I_3 : in STD_LOGIC_VECTOR (3 downto 0);
           I_4 : in STD_LOGIC_VECTOR (3 downto 0);
           I_5 : in STD_LOGIC_VECTOR (3 downto 0);
           I_6 : in STD_LOGIC_VECTOR (3 downto 0);
           I_7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

--counter
SIGNAL memory_select,counter_in : STD_LOGIC_VECTOR (2 downto 0);

--ROM
SIGNAL instruction : STD_LOGIC_VECTOR (11 downto 0);

-- Instruction decoder
SIGNAL register_enable : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL load_select,operation,jump_flag :STD_LOGIC;
SIGNAL register_select_0,register_select_1,address_to_jump : STD_LOGIC_VECTOR (2 downto 0);
SIGNAL immidiate_value : STD_LOGIC_VECTOR (3 downto 0);
--3bit adder
SIGNAL adder3bit_out : STD_LOGIC_VECTOR (2 downto 0);

--4BIT ADDER SUB

SIGNAL adder_subtrctor_out,adder_subtrctor_in_0,adder_subtrctor_in_1 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL adder_subtrctor_overflow,adder_subtrctor_zero :STD_LOGIC;


--REgistor Bank

SIGNAL register_data_in : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL R0_out,R1_out,R2_out,R3_out,R4_out,R5_out,R6_out,R7_out : STD_LOGIC_VECTOR (3 downto 0);

--
begin

program_counter:Counter
    PORT MAP(
    Dir =>'1',
    Res =>Reset,
    Clk=>Clock,
    Q => memory_select
    );
program_ROM:ROM
     Port MAP( 
        address=>memory_select,
        data=>instruction
    );
instruction_decoder:InstructionDecorder
     Port Map(Instruction=>instruction,
         Register_Enable =>register_enable,
         Load_Select =>load_select,
         Immidiate_Value =>immidiate_value,
         Register_Select_1 =>register_select_0,
         Register_Select_2 =>register_select_1,
         Jump_Flag=>jump_flag,
         Address_to_jump=>address_to_jump,
         --adder 1 , subtractor 2
         Operation => operation  
      );
      
adder_3bit0:adder_3bit
    Port MAP( A =>memory_select,
             B => "001",
             SUM =>adder3bit_out
            );
            
MUX_2_3bit_0: MUX_2_3bit
       Port MAP( 
           A =>adder3bit_out,
           B =>address_to_jump,
           S =>jump_flag,
           F =>counter_in
        );

MUX_2_4bit_0: MUX_2_4bit
       Port MAP( 
           A =>immidiate_value,
           B =>adder_subtrctor_out,
           S =>load_select,
           F =>register_data_in
        );   
register_bank0:register_bank
            Port MAP ( 
                   clock => clock,
                   register_en =>register_enable,
                   data_in =>register_data_in,
                   out_R0 =>R0_out,
                   out_R1 =>R1_out,
                   out_R2 =>R2_out,
                   out_R3 =>R3_out,
                   out_R4 =>R4_out,
                   out_R5 =>R5_out,
                   out_R6 =>R6_out,         
                   out_R7 =>R7_out                   
                   );

MUX_8_4bit_0 : MUX_8_4bit
    Port Map( 
           I_0  =>R0_out, 
           I_1  =>R1_out, 
           I_2  =>R2_out, 
           I_3  =>R3_out, 
           I_4  =>R4_out, 
           I_5  =>R5_out, 
           I_6  =>R6_out, 
           I_7  =>R7_out,  
           S =>register_select_0,
           Y =>adder_subtrctor_in_0
           );
           
MUX_8_4bit_1 : MUX_8_4bit
       Port Map( 
              I_0  =>R0_out, 
              I_1  =>R1_out, 
              I_2  =>R2_out, 
              I_3  =>R3_out, 
              I_4  =>R4_out, 
              I_5  =>R5_out, 
              I_6  =>R6_out, 
              I_7  =>R7_out,  
              S =>register_select_1,
              Y =>adder_subtrctor_in_1
              );
Adder_subtractor_4bit_0: Adder_subtractor_4bit
      Port MAP( A =>adder_subtrctor_in_0,
             B =>adder_subtrctor_in_1,
             SUM =>adder_subtrctor_out, 
             C_OUT =>adder_subtrctor_overflow,
             C_IN =>'0',
             Zero=>adder_subtrctor_zero,
             SUB =>operation
      );
                  
end Behavioral;
