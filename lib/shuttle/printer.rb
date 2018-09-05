# printer
module Shuttle
  # @!method
  class Printer
    def print(cmds)
      rows = cmds.map(&:to_a)
      puts Terminal::Table.new rows: rows, heading: %w[number name cmd]
    end
  end
end