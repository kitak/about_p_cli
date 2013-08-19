# coding: utf-8
require 'thor'
require 'highline'
require 'pit'

module AboutP
  class Command < Thor
    desc :search, %(Fuzzy string searching at about p)
    def search(query)
      key = get_key || set_key
      result = API.search(key, query)
      result.each do |user|
        extend_size = user.keys.map { |column| column.size }.max
        user.each do |key, value|
          puts "#{padding(key, extend_size)}: #{value}"
        end
        puts "-"*30
      end
    end

    desc :set_key, %(Setting API key)
    def set_key
      key = HighLine.new.ask("Enter API key:") { |q| q.echo = "*" }
      key = key.to_s
      Pit.set("about_p", :data => {
        "api_key" => key
      })
      key
    end

    private
    def get_key
      Pit.get("about_p")["api_key"]
    end

    def padding(value, extend_size)
      padding_size = extend_size - value.size
      value if padding_size < 0
      value + (" " * padding_size)
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
