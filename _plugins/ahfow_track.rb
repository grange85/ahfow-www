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
#    {% ahfowtrack "Track name" %}

module Jekyll
  class AhfowTrack < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        ahfowtrack = tag_contents[1]
        ahfowtrack_tag(ahfowtrack)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'ahfowtrack' while parsing the following markup:

  #{@markup}

Valid syntax:
  {% ahfowtrack "Track name" %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/\"(.*?)\"/)
    end

    def ahfowtrack_tag(trackname)
        slugged = trackname.gsub('&apos;', '\'')
        slugged = slugged.gsub('&amp;', '&')
        slugged = Utils.slugify(slugged)
        "<a href=\"/database/tracks/#{slugged}/\">#{trackname}</a>"
    end
  end
end

Liquid::Template.register_tag('ahfowtrack', Jekyll::AhfowTrack)
