
require 'thor'

module AboutP
  class Command < Thor
    desc :search, %(Fuzzy string searching at about p)
    def search(query)
      puts "#{query}で検索"
    end

    class << self
      # default_command で指定しても「aboutp クエリ」とかで呼び出すと
      # クエリがコマンドだと認識されるので、
      # handle_no_command_errorをハンドリングする
      def handle_no_command_error(command, has_namespace = $thor_runner)
        Command.new.search(command)
      end
    end
  end
end
