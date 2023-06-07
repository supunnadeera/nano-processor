library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity InstructionDecorder is
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
         
         
end InstructionDecorder;

architecture Behavioral of InstructionDecorder is
 

begin
 Register_Enable <= Instruction(11 downto 9);
 Load_Select <= Instruction(8);
 Immidiate_Value <= Instruction(7 downto 4);
 Register_Select_1<= Instruction(6 downto 4);
 Register_Select_2<= Instruction(3 downto 1);
 Operation <= Instruction(0);

end Behavioral;