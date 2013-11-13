#!/usr/bin/env ruby

require_relative "../lib/simple_circuit.rb"
require "choice"

Choice.options do
    header ""
    header "To calculate a simple circuit's properties, provide at least *two* known properties."
    header "For example, define at least the current and voltage, or the power and resistance"
    header ""

    option :current do
        short "-c"
        long  "--current=CURRENT"
        desc  "The circuit's current (in amps)"
    end

    option :power do
        short "-p"
        long  "--power=POWER"
        desc  "The circuit's power (in watts)"
    end

    option :resistance do
        short "-r"
        long  "--resistance=RESISTANCE"
        desc  "The circuit's resistance (in ohms)"
    end

    option :voltage do
        short "-v"
        long  "--voltage"
        desc  "The circuit's voltage (in volts)"
    end

    footer ""
end

# TODO: add support for floats
if Choice.choices[:current]
    if Choice.choices[:current] =~ /\./
        current = Choice.choices[:current].to_f
    else
        current = Choice.choices[:current].to_i
    end
else
    current = nil
end
power = Choice.choices[:power] ? Choice.choices[:power].to_i : nil
resistance = Choice.choices[:resistance] ? Choice.choices[:resistance].to_i : nil
voltage = Choice.choices[:voltage] ? Choice.choices[:voltage].to_i : nil

circuit = SimpleCircuit.new
circuit.current = current
circuit.power = power
circuit.resistance = resistance
circuit.voltage = voltage

# TODO: calculate voltage, current, resistance if power and at least one of the othe properties is known
puts "#{circuit.voltage} V"
puts "#{circuit.current} A"
puts "#{circuit.resistance} Ohms"
puts "POWER: #{circuit.power} W"
