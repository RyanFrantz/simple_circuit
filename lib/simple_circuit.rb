require "simple_circuit/version"

# calculate various properties based on given data (voltage, current, resistance, power, energy)
class SimpleCircuit
    #attr_accessor :voltage, :current, :resistance
    attr_writer :voltage, :current, :resistance
    def initialize( voltage = nil, current = nil, resistance = nil )
        @voltage = voltage
        @current = current
        @resistance = resistance
    end

    def current
        if @current
            @current
        elsif @voltage and @resistance
            # I = V/R
            @current = @voltage / @resistance
        else
            puts "Either define the current for this circuit, or provide the voltage and resistance of the circuit."
        end
    end

    def resistance
        if @resistance
            @resistance
        elsif @voltage and @current
            # R = V/I
            @resistance = @voltage / @current
        else
            puts "Either define the resistance for this circuit, or provide the voltage and current of the circuit."
        end
    end

    def voltage
        if @voltage
            @voltage
        elsif @current and @resistance
            # V = IR
            @voltage = @current * @resistance
        else
            puts "Either define the voltage for this circuit, or provide the current and resistance of the circuit."
        end
    end

    def power
        if @voltage and @current
            # P = VI
            @power = @voltage * @current
        elsif @current and @resistance
            # P = I^2R
            @power = ( @current ** 2 ) * @resistance
        elsif @voltage and @resistance
            # P = V^2/R
            @power = ( @voltage ** 2 ) / @resistance
        else
            puts "Insufficient circuit information. Provide at least two of the circuit's properties (i.e. current, voltage, resistance)."
        end
    end

end

circuit = SimpleCircuit.new
#circuit.voltage = 100
circuit.current = 2
circuit.resistance = 50
#puts "#{circuit.voltage}V"
#puts "#{circuit.current}A"
#puts "#{circuit.resistance} Ohms"

puts "POWER: #{circuit.power} W"
# TODO: calculate voltage, current, resistance if power and at least one of the othe properties is known
