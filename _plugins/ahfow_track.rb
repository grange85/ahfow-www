##
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
# 
# 
# AHFoW liquid ahfowimage
#
# Example:
#    {% ahfowimage image-url image-caption %}

module Jekyll
  class AhfowTrack < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        track = tag_contents[1]
        track_tag(track)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'track' while parsing the following markup:

  #{@markup}

Valid syntax:
  {% track "Track name" %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/\"(.*?)\"/)
    end

    def track_tag(trackname)
        slugged = Utils.slugify(trackname)
        "<a href=\"http://db.fullofwishes.co.uk/tracks/#{slugged}/ \">#{trackname}</a>"
    end
  end
end

Liquid::Template.register_tag('track', Jekyll::AhfowTrack)