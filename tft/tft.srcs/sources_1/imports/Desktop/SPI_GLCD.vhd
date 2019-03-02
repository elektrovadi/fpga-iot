
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity main is
port(

rst   :in std_logic;
clk  	:in std_logic;
clk_out  	:out std_logic;

rst_lcd		:out std_logic;
d_c			:out std_logic;

spi_data_out       : out std_logic;
spi_clk				 : out std_logic;
spi_ce				 : out std_logic


);
end main;

architecture Behavioral of main is

component spi_sender
port(
rst   :in std_logic;
clk  	:in std_logic;


gonderilecek_data  : in std_logic_vector(7 downto 0);
gonder_komutu_aktif_rising_edge  : in std_logic;

spi_data_out       : out std_logic;
spi_clk				 : out std_logic;
spi_ce				 : out std_logic

);
end component;

signal state :integer ;
signal sayici : unsigned(3 downto 0);

signal parelel_data : std_logic_vector(7 downto 0);
signal spi_gonder  : std_logic;

signal clk_sayici : unsigned (11 downto 0);
signal clk_yavas: std_logic;
constant GRAMWIDTH, GRAMHEIGH: Integer := 128;
begin

clk_out<=clk_yavas;
rst_lcd<=  rst;



spi :spi_sender
port map(
rst => rst,
clk  => clk_yavas,

gonderilecek_data  => parelel_data,
gonder_komutu_aktif_rising_edge  => spi_gonder,

spi_data_out       => spi_data_out,
spi_clk				 => spi_clk,
spi_ce				 => spi_ce

);


process(rst,clk)
begin
	if rst='0' then
			clk_sayici<=(others=>'0');
	elsif rising_edge(clk)then
			clk_sayici<=clk_sayici+1;
			
	end if;

end process;

clk_yavas<=clk_sayici(11);

process(clk_yavas,rst)
begin


	if rst='0' then
	
		   state<=0;
			parelel_data<=X"00";
			spi_gonder<='0';
			D_C<='0';		
			sayici<=(others=>'0');
			
	elsif rising_edge(clk_yavas) then
	
	  case(state) is
		
		when 0 =>
		
			parelel_data<=X"11"; --EXIT_SLEEP_MODE
			spi_gonder<='1';
			D_C<='0';	
			
			if (sayici< "1111") then--bekleme suresi
				sayici<=sayici+1;
			else
				sayici<=(others=>'0');
				state<=state+1;
				spi_gonder<='0';
			end if;
				
		when 1 =>
		
			parelel_data<=X"3A"; --SET_PIXEL_FORMAT
			spi_gonder<='1';
			D_C<='0';	
			
			if (sayici< "1111") then--bekleme suresi
				sayici<=sayici+1;
			else
				sayici<=(others=>'0');
				state<=state+1;
				spi_gonder<='0';
			end if;	

		when 2 =>
		
			parelel_data<=X"05"; --16 bits per pixel
			spi_gonder<='1';
			D_C<='1';	
			
			if (sayici< "1111") then--bekleme suresi
				sayici<=sayici+1;
			else
				sayici<=(others=>'0');
				state<=state+1;
				spi_gonder<='0';
			end if;		

		when 3 =>
		
			parelel_data<=X"26"; --SET_GAMMA_CURVE
			spi_gonder<='1';
			D_C<='0';	
			
			if (sayici< "1111") then--bekleme suresi
				sayici<=sayici+1;
			else
				sayici<=(others=>'0');
				state<=state+1;
				spi_gonder<='0';
			end if;				

		when 4 =>
		
			parelel_data<=X"04"; --Select gamma curve 3
			spi_gonder<='1';
			D_C<='1';	
			
			if (sayici< "1111") then--bekleme suresi
				sayici<=sayici+1;
			else
				sayici<=(others=>'0');
				state<=state+1;
				spi_gonder<='0';
			end if;				
			
		when 5 =>
		
			parelel_data<=X"29"; --SET_DISPLAY_ON
			spi_gonder<='1';
			D_C<='0';	
			
			if (sayici< "1111") then--bekleme suresi
				sayici<=sayici+1;
			else
				sayici<=(others=>'0');
				state<=state+1;
				spi_gonder<='0';
			end if;	
			
        when 6 =>
        
            parelel_data<=X"2C"; --WRITE_MEMORY_START
            spi_gonder<='1';
            D_C<='0';    
            
            if (sayici< "1111") then--bekleme suresi
                sayici<=sayici+1;
            else
                sayici<=(others=>'0');
                state<=state+1;
                spi_gonder<='0';
            end if;    
--ÝLKLENDÝRME TAMAMLANDI.			
--ekraný renk ile doldur
		when 7 =>
		          state<= 7;

		when 8 =>
				state<= 8;

			
		
		 when others=>
			state<=0;
				
		end case;
	end if;
	
end process;
end Behavioral;
