# Denrei

Denrei shows Ruby/Tk-Dialog with your favorite titile & message.

## Installation

Add this line to your application's Gemfile:

    gem 'denrei'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install denrei



## Usage

Only you have to do is execute command denrei in command prompt.(default title=Denrei, message=Finish!!)

    denrei

If you want to use custom title or message, first create Denreifile.

    denrei init

And you can change your favorite title & message

    # encoding: utf-8
    # ***title-settings***
    # if you want to change defalt title "Denrei", comment out title_text and set your text
    title_text "set your favorite title"

    # ***message-settings***
    # if you want to change defalt message "finish", comment out message_text and set your text
    message_text "set your favorite message"

After setting your favorites, you execute denrei.

    denrei

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
