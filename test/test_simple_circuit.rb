#!/usr/bin/env ruby

require "test/unit"
require_relative "../lib/simple_circuit.rb"

class TestSimpleCircuit < Test::Unit::TestCase

    # integer support
    def test_define_current_as_integer
        circuit = SimpleCircuit.new
        circuit.current = 1
        assert_equal( 1, circuit.current )
    end

    def test_define_power_as_integer
        circuit = SimpleCircuit.new
        circuit.power = 20
        assert_equal( 20, circuit.power )
    end

    def test_define_resistance_as_integer
        circuit = SimpleCircuit.new
        circuit.resistance = 300
        assert_equal( 300, circuit.resistance )
    end

    def test_define_voltage_as_integer
        circuit = SimpleCircuit.new
        circuit.voltage = 4000
        assert_equal( 4000, circuit.voltage )
    end

    # float support
    def test_define_current_as_float
        circuit = SimpleCircuit.new
        circuit.current = 0.10
        assert_equal( 0.10, circuit.current )
    end

    def test_define_power_as_float
        circuit = SimpleCircuit.new
        circuit.power = 2.5
        assert_equal( 2.5, circuit.power )
    end

    def test_define_resistance_as_float
        circuit = SimpleCircuit.new
        circuit.resistance = 300.75
        assert_equal( 300.75, circuit.resistance )
    end

    def test_define_voltage_as_float
        circuit = SimpleCircuit.new
        circuit.voltage = 4000.1234
        assert_equal( 4000.1234, circuit.voltage )
    end

    # test calculations
    ## current
    def test_calc_current_with_voltage_and_resistance
        circuit = SimpleCircuit.new
        circuit.voltage = 100
        circuit.resistance = 100
        assert_equal( 1, circuit.current )
    end

    ## power
    def test_calc_power_with_current_and_voltage
        circuit = SimpleCircuit.new
        circuit.current = 2
        circuit.voltage = 100
        assert_equal( 200, circuit.power )
    end

    def test_calc_power_with_current_and_resistance
        circuit = SimpleCircuit.new
        circuit.current = 2
        circuit.resistance = 2000
        assert_equal( 8000, circuit.power )
    end

    def test_calc_power_with_voltage_and_resistance
        circuit = SimpleCircuit.new
        circuit.voltage = 100
        circuit.resistance = 2000
        assert_equal( 5, circuit.power )
    end

    ## resistance
    def test_calc_resistance_with_voltage_and_current
        circuit = SimpleCircuit.new
        circuit.voltage = 50
        circuit.current = 2
        assert_equal( 25, circuit.resistance )
    end

end
