#require "simple_circuit/version"

# calculate various properties based on given data (voltage, current, resistance, power, energy)
# TODO:
# 1. add support for floats
# 2. errors should raise an exception

class SimpleCircuit
    #attr_accessor :voltage, :current, :resistance
    attr_writer :current, :power, :resistance, :voltage
    def initialize( voltage = nil, current = nil, resistance = nil )
        @voltage = voltage
        @current = current
        @resistance = resistance
    end

    def current
        if @voltage and @resistance
            # I = V/R
            @current = @voltage / @resistance
        elsif @current
            @current
        else
            puts "Either define the current for this circuit, or provide the voltage and resistance of the circuit."
        end
    end

    def resistance
        if @voltage and @current
            # R = V/I
            @resistance = @voltage / @current
        elsif @resistance
            @resistance
        else
            puts "Either define the resistance for this circuit, or provide the voltage and current of the circuit."
        end
    end

    def voltage
        if @current and @resistance
            # V = IR
            @voltage = @current * @resistance
        elsif @voltage
            @voltage
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
        elsif @power
            @power
        else
            puts "Insufficient circuit information. Provide at least two of the circuit's properties (i.e. current, voltage, resistance)."
        end
    end

end
