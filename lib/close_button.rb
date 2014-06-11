# encoding: utf-8
require 'tk'

module Denrei
  # = Denrei CloseButton
  class CloseButton
    def self.add_close_button # rubocop:disable MethodLength
      btn_OK = TkButton.new(TkRoot.new) do
        text 'close'
        width 10
        focus
        borderwidth 5
        underline 0
        state 'normal'
        cursor 'hand2'
        font TkFont.new('times 20 bold')
        foreground 'red'
        activebackground 'blue'
        relief 'raised'
        command { exit }
        pack('side' => 'right',  'padx' => '50', 'pady' => '10')
      end
    end
  end
end
