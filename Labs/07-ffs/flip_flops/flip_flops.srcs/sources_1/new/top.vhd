----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 17:07:09
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( 
           BTNU   : in STD_LOGIC;       -- Clock emulator
           BTNC   : in STD_LOGIC;       -- Synchronous reset
           SW     : in STD_LOGIC_VECTOR(1 - 1 downto 0);    -- Shift register serial input
           LED    : out STD_LOGIC_VECTOR(4 - 1 downto 0)    -- Shift register parallel outputs
           );
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

    -- Internal signals between flip-flops
    -- WRITE YOUR CODE HERE
    signal q_0_1 : std_logic;
    signal q_1_2 : std_logic;
    signal q_2_3 : std_logic;
    signal q_3_0 : std_logic;

begin

    --------------------------------------------------------------------
    -- Four instances (copies) of D type FF entity
    d_ff_0 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => SW(0),
            q     => q_0_1
        );

    d_ff_1 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => q_0_1,
            q     => q_1_2
        );
        
        d_ff_2 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => q_1_2,
            q     => q_2_3
        );
        
        d_ff_3 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            d     => q_2_3,
            q     => q_3_0
        );

    LED(0) <= q_0_1;
    LED(1) <= q_1_2;
    LED(2) <= q_2_3;
    LED(3) <= q_3_0;

end architecture Behavioral;
