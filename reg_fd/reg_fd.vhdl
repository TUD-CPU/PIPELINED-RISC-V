library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_fd is
    port(
        --inputs
        clk         : in std_logic;
        en          : in std_logic;
        clr         : in std_logic;
        rd          : in std_logic_vector(31 downto 0);
        pc_f        : in std_logic_vector(31 downto 0);
        pcplus4_f   : in std_logic_vector(31 downto 0);
        --outputs
        instr_d     : buffer std_logic_vector(31 downto 0);
        pc_d        : out std_logic_vector(31 downto 0);
        pcplus4_d   : out std_logic_vector(31 downto 0)
    );
end reg_fd;

architecture rtl of reg_fd is

    type ramtype is array (2 downto 0) of std_logic_vector(31 downto 0);
    signal memory : ramtype;

    begin
        process(clk)begin

            if rising_edge(clk) and (en = '0') then
                if(clr = '1') then
                    memory <= (others => (others => '0'));
                else
                    memory(0)   <=  rd;
                    memory(1)   <=  pc_f;
                    memory(2)   <=  pcplus4_f;
                end if;
            end if;
        end process;

        instr_d     <=  memory(0);
        pc_d        <=  memory(1);
        pcplus4_d   <=  memory(2);
    
    end rtl;