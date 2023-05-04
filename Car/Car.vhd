library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declare the input and output signals
entity Car is
    Port ( --clock : in  STD_LOGIC;
           lane_sensor : in  STD_LOGIC;
           infrared_sensor : in  STD_LOGIC;
           motor_control : out  STD_LOGIC;
			  seg1,seg2,seg3,seg4,seg5: out std_logic_vector(0 to 6)); 
end Car;

-- Define the behavior of the car control logic
architecture Behavioral of Car is
begin
    -- Determine the appropriate control signal for the motor based on the sensor inputs
    process (lane_sensor,infrared_sensor)
    begin
            -- If the car is within its lane and there is no obstacle, allow the car to move
            if (lane_sensor = '0' and infrared_sensor = '0') then
                motor_control <= '0';
					 seg1<="0001000";
				    seg2<="1110001";
				    seg3<="0110000";
				    seg4<="1111010";
				    seg5<="1110000";
            -- If the car is outside its lane, display a warning and stop the car
            elsif (lane_sensor = '0') then
				motor_control <= '1';
				   seg1<="0001000";
				   seg2<="1110001";
				   seg3<="0110000";
				   seg4<="1111010";
				   seg5<="1110000";
				
               -- motor_control <= '0';
                -- Display warning message on 7 segment display
            -- If there is an obstacle in front of the car, stop the car
            elsif (infrared_sensor = '0') then
                motor_control <= '0';
					seg1<="1111111";
				   seg2<="1111111";
				   seg3<="1111111";
				   seg4<="1111111";
				   seg5<="1111111";
			   else 
					 motor_control <= '1';
					 seg1<="1111111";
				    seg2<="1111111";
				    seg3<="1111111";
				    seg4<="1111111";
				    seg5<="1111111";
					 

            end if;
    end process;
end Behavioral;
