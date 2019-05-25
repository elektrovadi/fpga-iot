----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:22:03 11/26/2015 
-- Design Name: 
-- Module Name:    park - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ultrasonic is

	Port(
	clk			:in std_logic; -- clock signal
	trig_pin 	:out  std_logic;-- trigger pin of sensor	
	echo_pin    :in std_logic; -- echo pin of sensor to calculate the distance 
	katot			: inout std_logic_vector  (7 downto 0); --seven segment segs
	anot			: inout std_logic_vector  (3 downto 0); --seven segment anots
	led: out std_logic_vector(11 downto 0)-- park sensor's leds
	);
end ultrasonic;
architecture Behavioral of ultrasonic is

signal trigger:std_logic;
signal echo:std_logic; -- echo signal


begin
	
	process(clk,trigger,echo,echo_pin)
	
	variable counter_trig:integer range 0 to 100000000:=0; -- to create 10us trigger signal
	variable counter_timer:integer range 0 to 100000000:=0;-- to measure 1cm distance 
	variable anot_counter: unsigned (16 downto 0):=(others=>'0');
	variable i: unsigned (11 downto 0):=(others=>'0'); -- cm variable
	variable i_temp: unsigned (11 downto 0):=(others=>'0'); -- cm variable
	
	variable i_bcd: unsigned (11 downto 0):=(others=>'0');
	
	
	begin

		if rising_edge(clk) then
			--trig_pin<=trigger;
			echo<=echo_pin;
		end if;
		-- seven segment anot scanning
		if rising_edge(clk) then
			anot_counter:=anot_counter+1;
		end if;

		case (std_logic_vector'(anot_counter(16),anot_counter(15))) is
			when"00"=> anot<="1110";
			when"01"=> anot<="1101";
			when"10"=> anot<="1011";
			when others=> anot<="0111";
		end case;
		-- seven segment anot scanning 
		
		if rising_edge (clk) then
			if(counter_trig=6000000) then -- to create the one period of trigger signal
				counter_trig:=0;
			else
				counter_trig:=counter_trig+1;
			end if;
		end if;
		if rising_edge (clk) then
			if (counter_trig<1000) then -- to create the 10us high trigger signal
				trig_pin<='1';
			else
				trig_pin<='0';
			end if;
		end if;
		
		
		if rising_edge (clk) then
			if ( echo='1') then
				if (counter_timer=5882) then -- measure just 1cm distance 
					counter_timer:=0;
					i:=i+1; -- hold the cm
					i_temp:=i; -- in order to not lose cm information
				else
					counter_timer:=counter_timer+1;  -- count the pulse during high of echo signal
				end if;
			end if;
			
			if( echo='0') then
				i:="000000000000"; -- make it zero for each measurement cycle
			end if;
		end if;


       
			
		if rising_edge (clk) then
					
			-- adjust the flashing leds according to the distance 
				if i_temp<"000000000101" then     --5
					led<="000000000001";
				elsif i_temp<"000000001010" then --10
					led<="000000000011";
				elsif i_temp<"000000001111" then --15
					led<="000000000111";
				elsif i_temp<"000000010100" then --20
					led<="000000001111";
				elsif i_temp<"000000011001" then --25
					led<="000000011111";
				elsif i_temp<"000000011110" then --30
					led<="000000111111";
				elsif i_temp<"000000100011" then --35
					led<="000001111111";
				elsif i_temp<"000000101000" then --40
					led<="000011111111";
				elsif i_temp<"000000101101" then --45
                    led<="000111111111";
                elsif i_temp<"000000110010" then --50
                    led<="001111111111";
                elsif i_temp<"000000110111" then --55
                    led<="011111111111";
                elsif i_temp<"000000111100" then --60
                    led<="111111111111";
				else 
					led<="111111111111";
				end if;
			
		end if;
				
		
-- bcd conversion starts		

--using the bcd algorithm, we found the digits of distance, for examle for i_temp=13, => "1" "3"
if i_temp<"000000001010" then ---- <10
i_bcd:=i_temp;
elsif i_temp<"000000010100" then ---<20
i_bcd:=i_temp+6;
elsif i_temp<"000000011110" then ----30
i_bcd:=i_temp+12;
elsif i_temp<"000000101000"then
i_bcd:=i_temp+18;
elsif i_temp<"000000110010"then--50
i_bcd:=i_temp+24;
elsif i_temp<"000000111100" then
i_bcd:=i_temp+30;
elsif i_temp<"000001000110" then
i_bcd:=i_temp+36;
elsif i_temp<"000001010000" then
i_bcd:=i_temp+42;
elsif i_temp<"000001011010"then
i_bcd:=i_temp+48;
elsif i_temp<"000001100100"then--100 
i_bcd:=i_temp+54;

else
i_bcd:="100010001000";
end if;
-- bcd conversion finished

		
		-- seven segment display
		
			if anot="1110" then--anot0
				case (i_bcd(3 downto 0)) is
		  			when"0000"=> katot<="11000000";
		  			when"0001"=> katot<="11111001";
					when"0010"=> katot<="10100100";
					when"0011"=> katot<="10110000";
					when"0100"=> katot<="10011001";
					when"0101"=> katot<="10010010";
					when"0110"=> katot<="10000010";
					when"0111"=> katot<="11111000";
					when"1000"=> katot<="10000000";
					when others=>katot<="10010000";
				end case;
			end if;

			if anot="1101" then--anot1 
				case (i_bcd(7 downto 4)) is
					when"0000"=> katot<="11000000";
					when"0001"=> katot<="11111001";
					when"0010"=> katot<="10100100";
					when"0011"=> katot<="10110000";
					when"0100"=> katot<="10011001";
					when"0101"=> katot<="10010010";
					when"0110"=> katot<="10000010";
					when"0111"=> katot<="11111000";
					when"1000"=> katot<="10000000";
					when others=>katot<="10010000";
				end case;
			end if;

			if anot="1011" then--anot2 
				case (i_bcd(11 downto 8)) is
					when"0000"=> katot<="11000000";
					when"0001"=> katot<="11111001";
					when"0010"=> katot<="10100100";
					when"0011"=> katot<="10110000";
					when"0100"=> katot<="10011001";
					when"0101"=> katot<="10010010";
					when"0110"=> katot<="10000010";
					when"0111"=> katot<="11111000";
					when"1000"=> katot<="10000000";
					when others=>katot<="10010000";
				end case;
			end if;

			if anot="0111" then--anot3 
				katot<="11111111";
			end if;
			
			
			
			
			
	--	end if;


		-- seven segment display
	
		
		
	end process;
	


end Behavioral;

