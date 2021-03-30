----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 17:31:37
-- Design Name: 
-- Module Name: tb_top - Behavioral
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

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    signal s_clk   : std_logic;
    signal s_rst   : std_logic;
    signal s_d     : std_logic;
    signal s_q     : std_logic_vector(4 - 1 downto 0);
begin


    uut_top : entity work.top
        port map(
            BTNU     => s_clk,
            BTNC     => s_rst,
            SW(0)    => s_d,
            LED      => s_q
            
        );
        
        
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 42 ns;
        
        -- Reset activated
        s_rst <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_rst <= '0';

        wait for 81 ns;
        
        s_rst <= '1';
        wait for 25 ns;

        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        s_d <= '0';
        wait for 12 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 10 ns;
        s_d <= '1';
        wait for 5 ns;
        s_d <= '0';
        wait for 20 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 5 ns;
        s_d <= '1';
        wait for 20 ns;
        s_d <= '0';
        wait for 10 ns;
        
        s_d <= '1';
        wait for 2 ns;
        
        wait for 8 ns;
        s_d <= '0';
        wait for 2 ns;
        wait for 28 ns;
        s_d <= '1';
        wait for 30 ns;
        s_d <= '0';
        wait for 30 ns;
        s_d <= '1';
        wait for 20 ns;
        s_d <= '0';
        wait for 30 ns;
        s_d <= '1';
        wait for 10 ns;
        s_d <= '0';
        wait for 20 ns;
        
        wait for 2 ns;
        s_d <= '1';
        wait for 8 ns;
        s_d <= '0';
        wait for 20 ns;
        s_d <= '1';
        wait for 30 ns;
        s_d <= '0';
        wait for 10 ns;
        
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
    
end Behavioral;
