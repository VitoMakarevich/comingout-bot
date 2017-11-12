require './lib/message_sender'
require_relative 'info_reader'

# class for respond to telegram bot
class MessageResponder
  attr_reader :message
  attr_reader :bot
  START_TEXT = '/start'.freeze
  STOP_TEXT = '/stop'.freeze
  HELLO_MESSAGE = 'Привет, я могу рассказать много интересного ;)'.freeze
  BYE_MESSAGE = 'Надеюсь, тебе было интересно ;)'.freeze
  RESOLVE = 'Да'.freeze
  REJECT = 'Нет'.freeze

  def initialize(options)
    @bot = options[:bot]
    @message = options[:message]
    @info_reader = InfoReader.new
  end

  def respond
    case @message.text
    when START_TEXT
      answer_with_message(HELLO_MESSAGE)
    when STOP_TEXT
      answer_with_message(BYE_MESSAGE)
    else
      find_answer
    end
  end

  private

  def find_answer
    if @info_reader.is?(@message.text)
      answer_with_message(RESOLVE)
    else
      answer_with_message(REJECT)
    end
  end

  def answer_with_message(text)
    MessageSender.new(bot: bot, chat: message.chat, text: text).send
  end
end
