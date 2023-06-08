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
     Register_Enable <= Instruction(9 downto 7);

     Immidiate_Value <= Instruction(3 downto 0);
     
     Register_Select_1<= Instruction(9 downto 7);
     Register_Select_2<= Instruction(6 downto 4);
     
     Operation <= '1' when (Instruction(11 downto 10) = "01") else '0';
     
     Load_Select<= '0' when (Instruction(3 downto 0) = "0000") else '1';
     

end Behavioral;