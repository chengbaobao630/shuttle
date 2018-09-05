# reader
module Shuttle
  # Your code goes here...
  #
  class Reader

    def initialize
      @global_id = 0
      @cmds = []
    end


    # @!attribute
    class Cmd
      attr_accessor :id, :name, :cmd

      def initialize(id, name, cmd)
        @id = id
        @name = name
        @cmd = cmd
      end

      def to_a
        [id, name, cmd.length > 100 ? cmd[0, 100] + '...' : cmd]
      end

      def connect
        system cmd
      end

    end

    def parse_file
      read_file.with_indifferent_access[:hosts].each do |host|
        parse_json host
      end
      @cmds
    end

    def parse_json(host)
      if host.is_a? Array
        host.each do |c_host|
          parse_json c_host
        end
      elsif host[:name] && host[:cmd]
        @cmds.push Cmd.new(
          @global_id += 1,
          host[:name],
          host[:cmd]
        )
      else
        host.values.flatten.map do |c_host|
          parse_json c_host
        end
      end
      # code here
    end

    def read_file
      JSON.parse File.open(ENV['HOME'] + '/.shuttle.json', 'rb', &:read)
    end
  end
end