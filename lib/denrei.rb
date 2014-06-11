# encoding: utf-8
require 'denrei/version'
require 'tk'
require 'close_button'
require 'message_label'
require 'title_label'

module Denrei
  # = Denrei Core
  class Core
    attr_accessor :title, :message
# rubocop:disable all
    DENREI_TEMPLATE = <<-EOS
# encoding: utf-8
# ***title-settings***
# if you want to change defalt title "Denrei", comment out title_text and set your text
# title_text "title text"

# ***message-settings***
# if you want to change defalt message "Finish!!", comment out message_text and set your text
# message_text "message text"
    EOS
# rubocop:enable all

    INVALID_DSL_MESSAGE = <<-EOS
you can use only these dsl

# this set dialog title
title_text "value"
# this set dialog message
message_text "value"
    EOS

    # == generate denreifile template
    def init
      File.open('./Denreifile', 'w') { |f|f.puts DENREI_TEMPLATE }
    end

    # == read Denreifile
    # read current directory's Denreifile file.
    # if Denreifile is not exists, do nothing.
    # if Denreifile is exists, set gui parameters by DenreiDSL.
    def read_denreifile
      set_default
      return unless File.exist? './Denreifile'
      execute_denrei_dsl read_denreifile_source
    end

    # == OpenMessageDialog
    def open
      TitleLabel.setting_title_label(@title)
      MessageLabel.setting_message_label(@message)
      CloseButton.add_close_button
    end

    # == keep display GUI
    def keep_tk
      Tk.mainloop
    end

    private

    def read_denreifile_source
      File.open('./Denreifile') { |f|f.read }
    end

    def execute_denrei_dsl(source)
      source.each_line do |line|
        begin
          instance_eval(line)
        rescue => e
          puts "invalid dsl = #{line}"
          puts INVALID_DSL_MESSAGE
          raise Denrei::DenreiDslError.new
          exit(false)
        end
      end
    end

    def set_default
      @title = 'Denrei'
      @message = 'Finish!!'
    end

    def title_text(title)
      @title = title
    end

    def message_text(message)
      @message = message
    end
  end

  class DenreiDslError < StandardError; end
end
