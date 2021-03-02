# Lab-03 vivado
## 1. Preparation tasks - Nexys A7 board
![Nexys A7 board table](images/NexysA7boardTable.jpg)

## 2. Two-bit wide 4-to-1 multiplexer
### mux_2bit_4to1.vhd - architecture
```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin
    
    f_o <= a_i when (sel_i = "00") else
            b_i when (sel_i = "01") else
            c_i when (sel_i = "10") else
            d_i;

end architecture Behavioral;
```
### tb_mux_2bit_4to1.vhd - stimulus process
```vhdl
p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "01"; s_c <= "10"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "01"; s_c <= "10"; s_b <= "00"; s_a <= "01"; 
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "01"; s_c <= "10"; s_b <= "10"; s_a <= "01"; 
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "10"; s_a <= "01"; 
        s_sel <= "10"; wait for 100 ns;
        
        s_c <= "11";
        wait for 100 ns;
        
        s_sel <= "11"; wait for 100 ns;
        
        s_d <= "00";
        s_sel <= "11"; wait for 100 ns;
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
### time waveforms
![Time waveforms](images/time_waveforms.png)

## 3. Vivado tutorial
### Creating a project
![Project creation 1](images/Vivado_tutorial-1.jpg)
![Project creation 2](images/Vivado_tutorial-2.jpg)
![Project creation 3](images/Vivado_tutorial-3.jpg)

### Adding testbench file
![Adding testbench file](images/Vivado_tutorial-4.jpg)

### Adding XDC constrains file
![Adding XDC constrains file](images/Vivado_tutorial-6.jpg)

### Running simulation
![Running simulation](images/Vivado_tutorial-5.jpg)

