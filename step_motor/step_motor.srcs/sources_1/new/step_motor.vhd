----------------------------------------------------------------------------------
-- Company: BET� B�L���M
-- Engineer: 

-- Module Name:    STEPPER_MOTOR - Behavioral 



------STEPPER MOTOR-----UYGULAMA 1--



----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


entity STEPPER_MOTOR is
Port ( 	  CLOCK : in  STD_LOGIC;--100MHz                                               
		  HIZLANDIR: in  STD_LOGIC;
		  STOP     : in  STD_LOGIC;
	       DONDUR: in  STD_LOGIC;
           BOBIN : out  STD_LOGIC_VECTOR (3 downto 0)
		);

end STEPPER_MOTOR;

architecture Behavioral of STEPPER_MOTOR is
signal A:std_logic;
signal B:std_logic;
signal C:std_logic;

begin

process(CLOCK,HIZLANDIR,A,B,C,DONDUR,STOP)

variable counter: unsigned(19 downto 0);
variable counter_v:unsigned(1 downto 0);

begin

if rising_edge (CLOCK) then   --e�er clock sinyali 0'dan 1'e ge�iyorsa
counter := counter+1;         --counter'�n de�erini 1 art�r�r.
end if;
A<=counter(17);           --H�zl� clock olarak A sinyalini atar.
C<=counter(19);           --YAVA� clock olarak A sinyalini atar.

if HIZLANDIR='1' then        --e�er h�zland�rma anahtar� a��ksa,
B<=A;                    	   --h�zl� clock aktif olur(A sinyali), 
elsif HIZLANDIR='0' THEN      -- yoksa normal clock aktif olur.       
B<=C;
END IF;


if rising_edge (B) AND STOP='0' then  --Normal clock sinyali 0'dan 1'e 
counter_v:= counter_v+1;          	  -- ge�iyorsa counter_v 1 artar.
end if;

IF DONDUR='0' THEN         --Donurme anahtar�n�n durumuna gore 
CASE (COUNTER_V) IS        --motorun hangi yonde d�nece�i belli olur.
WHEN"00"=> BOBIN<="1001";
WHEN"01"=> BOBIN<="1010";
WHEN"10"=> BOBIN<="0110";
WHEN OTHERS=> BOBIN<="0101";
END CASE;

ELSIF DONDUR='1' THEN

CASE (COUNTER_V) IS
WHEN"11"=> BOBIN<="1001";
WHEN"10"=> BOBIN<="1010";
WHEN"01"=> BOBIN<="0110";
WHEN OTHERS=> BOBIN<="0101";
END CASE;
END IF;

END PROCESS;
end Behavioral;
