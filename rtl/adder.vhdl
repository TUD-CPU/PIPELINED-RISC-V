library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    generic(WIDTH : integer := 32);
    port(
        --inputs
        a_in    : in std_logic_vector(31 downto 0);
        b_in    : in std_logic_vector(WIDTH-1 downto 0);
        --output
        c_out   : out std_logic_vector(31 downto 0)
    );
end adder;

architecture rtl of adder is
    begin
    
        c_out <= std_logic_vector(unsigned(a_in) + unsigned(b_in));
    
    end rtl;