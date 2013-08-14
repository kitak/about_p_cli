
require 'thor'

module AboutP
  class Command < Thor
    desc :search, %(Fuzzy string searching at about p)
    def search(query)
      puts "#{query}で検索"
    end

    class << self
      def handle_no_command_error(command, has_namespace = $thor_runner)
        Command.new.search(command)
      end
    end
  end
end
