----------------------------------------------------------------------------------
-- Company: 



--DOT MATRIX DENEY�--UYGULAMA 2--
--8*8 RGB DOT MATRIX MOD�L� KULLANILARAK
--EKRANA G�R�NT� BASILMI�TIR.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


entity rgb is
port(
			  CLOCK : in  STD_LOGIC;--50 MHz
         
			  OE:inout std_logic;--output enable
			  
			  SH_CP:OUT STD_LOGIC;--shift register clock pulse
			  ST_CP:OUT STD_LOGIC;--store register clock pulse
			  
			  reset:OUT STD_LOGIC;--shift register i�in reset

			  
				DS : out  std_logic;--digital signal
			  
           KATOT : out  STD_LOGIC_VECTOR (7 downto 0));
end RGB;

architecture Behavioral of rgb is


signal mesaj:std_logic_vector(24 downto 1);
alias k�rm�z� : Std_Logic_Vector(7 downto 0) is mesaj(24 downto 17) ;
alias yesil : Std_Logic_Vector(7 downto 0) is mesaj(16 downto 9) ;
alias mavi : Std_Logic_Vector(7 downto 0) is mesaj(8 downto 1) ;

signal f:std_logic;
signal e:std_logic;

begin

process(clock)

variable counter: unsigned(7 downto 0);
variable i:integer range 410 downto 1:=1;--data signalin seri olarak iletilmesini kontrol eder.
variable a:integer range 7 downto 0:=0;
variable d:integer range 800 downto 0:=0;

begin


if rising_edge(clock) then--registerlar i�in clock �retmek i�in kullan�l�yor.
counter:=counter+1;
end if;


f<=counter(7);--shift register i�in saat sinyali
e<=not f;


if rising_edge(e) then--seri olarak datay� almak i�in her clock pulse tan sonra i bir artt�r�l�yor.
i:=i+1;
end if;


if i<4 then---ba�lang��ta i 4'e gelene kadar sisteme reset at�l�r.
reset<='0';
else
reset<='1';
end if;


if i>3 and i<28 then--4'le 27 aras�nda data ak��� seri olarak.
DS<=mesaj(i-3);
else 
DS<='0';
end if;


if i<28 then--i 28'e geldi�inde data ak��� datamlan�yor.24 bit data al�nm�� oluyor. bu sureden sonra clock durduluyor yeni data ak���na kadar.
SH_CP<=f;             
ST_CP<=e;
else
SH_CP<='0';
ST_CP<='1';
end if;

if rising_edge(f) then--clock un durdu�u surede OE=0 yani output registerin ��k���nda aktif durumda.
if (i>28 and i<409) then
oe<='0';
else
oe<='1';
end if;
end if;


if rising_edge(f) then--bir sat�r tamamland���nda a bir artt�r�l�yor 2. sat�ra ge�mek i�in.
if i=410 then
a:=a+1;
end if;
end if;

if rising_edge(f) then--satrlar ve sutunlar tamamland���nda yeni g�r�nt� i�in(ful ekran) d bir artt�r�l�yor.
if i=410 then
if a=7 then
d:=d+1;
end if;
end if;
end if;

--a katotlar� taramak i�in kullan�l�yor.
		
if a=0 then
katot<="10000000";
elsif a=1 then
katot<="01000000";
elsif a=2 then
katot<="00100000";
elsif a=3 then
katot<="00010000";
elsif a=4 then
katot<="00001000";
elsif a=5 then
katot<="00000100";
elsif a=6 then
katot<="00000010";
else
katot<="00000001";
end if;


		if d<25 then--en d��a mavi kare olu�turur.(d 50'ye gelene kadar ekranda g�sterilecek �ekil yarat�l�yor.

if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="00000000";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="00000000";
mavi<="10000001";
yesil<="00000000";

elsif a=3 then

k�rm�z�<="00000000";
mavi<="10000001";
yesil<="00000000";

elsif a=4 then

k�rm�z�<="00000000";
mavi<="10000001";
yesil<="00000000";

elsif a=5 then

k�rm�z�<="00000000";
mavi<="10000001";
yesil<="00000000";

elsif a=6 then

k�rm�z�<="00000000";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;

		elsif d<50 then

if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00000000";

elsif a=3 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00000000";

elsif a=4 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00000000";

elsif a=5 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00000000";

elsif a=6 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;
		
		elsif d<75 then
		
if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=3 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00100100";

elsif a=4 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00100100";

elsif a=5 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=6 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;

		elsif d<100 then
		
if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=3 then

k�rm�z�<="01011010";
mavi<="10011001";
yesil<="00111100";

elsif a=4 then

k�rm�z�<="01011010";
mavi<="10011001";
yesil<="00111100";

elsif a=5 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=6 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;




		elsif d<125 then--ortadaki kare s�n�k
	
if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=3 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00100100";

elsif a=4 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00100100";

elsif a=5 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=6 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;

		elsif d<150 then--k�rm�z�+ye�il
	
if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=3 then

k�rm�z�<="01011010";
mavi<="10000001";
yesil<="00111100";

elsif a=4 then

k�rm�z�<="01011010";
mavi<="10000001";
yesil<="00111100";

elsif a=5 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=6 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;

		elsif d<175 then--mavi+k�rm�z�
	
if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=3 then

k�rm�z�<="01011010";
mavi<="10011001";
yesil<="00100100";

elsif a=4 then

k�rm�z�<="01011010";
mavi<="10011001";
yesil<="00100100";

elsif a=5 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=6 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;

		elsif d<200 then--ye�il+mavi
	
if a=0 then

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

elsif a=1 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=3 then

k�rm�z�<="01000010";
mavi<="10011001";
yesil<="00111100";

elsif a=4 then

k�rm�z�<="01000010";
mavi<="10011001";
yesil<="00111100";

elsif a=5 then

k�rm�z�<="01000010";
mavi<="10000001";
yesil<="00111100";

elsif a=6 then

k�rm�z�<="01111110";
mavi<="10000001";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="11111111";
yesil<="00000000";

end if;

		elsif ((d>400 and d<420) or (d>440 and d<460) or (d>440 and d<460) or (d>480 and d<500) or (d>520 and d<540)
or (d>560 and d<580) or (d>600))		then--g�len surat

if a=7 then--1.SUTUNU KONTROL EDER

k�rm�z�<="00000100";
mavi<="00000000";
yesil<="00000000";



elsif a=6 then

k�rm�z�<="00001000";
mavi<="00000100";
yesil<="00000000";

elsif a=5 then

k�rm�z�<="00000000";
mavi<="00000010";
yesil<="00100000";

elsif a=4 then

k�rm�z�<="00000001";
mavi<="00000010";
yesil<="00000000";

elsif a=3 then

k�rm�z�<="00000001";
mavi<="00000010";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="00000000";
mavi<="00000010";
yesil<="00100000";

elsif a=1 then

k�rm�z�<="00001000";
mavi<="00000100";
yesil<="00000000";

else

k�rm�z�<="00000100";
mavi<="00000000";
yesil<="00000000";

end if;

		else
	
if a=7 then--1.SUTUNU KONTROL EDER

k�rm�z�<="00000000";
mavi<="00000000";
yesil<="00000000";



elsif a=6 then

k�rm�z�<="00000000";
mavi<="00000100";
yesil<="00000000";

elsif a=5 then

k�rm�z�<="00000000";
mavi<="00000010";
yesil<="00010000";

elsif a=4 then

k�rm�z�<="00000000";
mavi<="00000010";
yesil<="00000000";

elsif a=3 then

k�rm�z�<="00000000";
mavi<="00000010";
yesil<="00000000";

elsif a=2 then

k�rm�z�<="00000000";
mavi<="00000010";
yesil<="00010000";

elsif a=1 then

k�rm�z�<="00000000";
mavi<="00000100";
yesil<="00000000";

else

k�rm�z�<="00000000";
mavi<="00000000";
yesil<="00000000";

end if;
		end if;
		
end process;
end Behavioral;