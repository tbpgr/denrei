# encoding: utf-8
require 'spec_helper'
require 'denrei'

describe Denrei::Core do
  cases_init = [
    {
      case_no: 1,
      expected: Denrei::Core::DENREI_TEMPLATE
    },
  ]

  cases_init.each do |c|
    it "#init case_no=#{c[:case_no]} generate Denreifile" do
      # given
      denrei = Denrei::Core.new

      # when
      denrei.init

      # then
      actual = File.open('Denreifile') { |f|f.read }
      expect(actual).to eq(c[:expected])
    end
  end

  cases_set_default = [
    {
      case_no: 1,
      expected: { title: 'Denrei', message: 'Finish!!' }
    },
  ]

  cases_set_default.each do |c|
    it "#set_default case_no=#{c[:case_no]} set set_default settings" do
      # given
      denrei = Denrei::Core.new

      # when
      denrei.method(:set_default).call

      # then
      c[:expected].each do |k, v|
        actual = denrei.method(k).call
        expect(actual).to eq(v)
      end
    end
  end

  EXECUTE_DENREI_DSL_VALID_INPUT = <<-EOS
title_text "title text"
message_text "message text"
  EOS

  EXECUTE_DENREI_DSL_ALL_COMMENT_INPUT = <<-EOS
# title_text "title text"
# message_text "message text"
  EOS

  EXECUTE_DENREI_DSL_INVALID_INPUT = <<-EOS
title_text_invalid "title text"
message_text "message text"
  EOS

  cases_execute_denrei_dsl = [
    {
      case_no: 1,
      input: EXECUTE_DENREI_DSL_VALID_INPUT,
      expected: { title: 'title text', message: 'message text' }
    },
    {
      case_no: 2,
      input: EXECUTE_DENREI_DSL_ALL_COMMENT_INPUT,
      expected: { title: nil, message: nil }
    },
    {
      case_no: 3,
      input: EXECUTE_DENREI_DSL_INVALID_INPUT,
      expected: { title: nil, message: nil },
      have_error: true
    },
  ]

  cases_execute_denrei_dsl.each do |c|
    it "#execute_denrei_dsl case_no=#{c[:case_no]} set set_default settings" do
      # given
      denrei = Denrei::Core.new

      # when
      if c[:have_error]
        -> { denrei.send(:execute_denrei_dsl, c[:input]) }
            .should raise_error(Denrei::DenreiDslError)
      else
        denrei.method(:execute_denrei_dsl).call(c[:input])
        # then
        c[:expected].each do |k, v|
          actual = denrei.method(k).call
          expect(actual).to eq(v)
        end
      end

    end
  end

  after(:each) do
    File.delete('Denreifile') if File.exist?('Denreifile')
  end
end
