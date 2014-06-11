# encoding: utf-8
require 'tk'

module Denrei
  # = Denrei TitleLabel
  class TitleLabel
    class << self
      # rubocop:disable MethodLength
      def setting_title_label(title)
        TkLabel.new do
          text title
          font TkFont.new(
                'family' => 'times',
                'weight' => 'bold',
                'size' => 20,
                'slant' => 'italic'
              )
          width 20
          height 2
          bd 5
          relief 'groove'
          pack
        end
      end
      # rubocop:enable MethodLength
    end
  end
end
