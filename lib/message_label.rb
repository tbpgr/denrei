# encoding: utf-8
require 'tk'

module Denrei
  # = Denrei MessageLabel
  class MessageLabel
    class << self
      # rubocop:disable MethodLength
      def setting_message_label(message)
        TkLabel.new do
          text message
          font TkFont.new(
                'family' => 'times',
                'weight' => 'bold',
                'size' => 20
              )
          width 20
          height 4
          bd 5
          relief 'groove'
          pack
        end
      end
      # rubocop:enable MethodLength
    end
  end
end
