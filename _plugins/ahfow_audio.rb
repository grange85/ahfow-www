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
# AHFoW liquid ahfowaudio
#
# Example:
#    {% ahfowaudio image-url image-caption %}

module Jekyll
  class AhfowAudioTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        ahfowaudio_url, ahfowaudio_caption = tag_contents[0], tag_contents[1]
        ahfowaudio_tag(ahfowaudio_url, ahfowaudio_caption)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'ahfowaudio' while parsing the following markup:

  #{@markup}

Valid syntax:
{% ahfowaudio audio-url audio-caption %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/["](.*?)["] ?["](.*?)["]/)
      [matched[1].to_s.strip, matched[2].to_s.strip] if matched && matched.length >= 3
    end

    def ahfowaudio_tag(ahfowaudio_url, ahfowaudio_caption = "audio")
        "<div class=\"well\"><p class=\"audio\">Audio: <a href=\"#{ahfowaudio_url}\">#{ahfowaudio_caption}</a></p><audio controls=\"controls\" preload=\"none\" src=\"#{ahfowaudio_url}\"></audio></div>"
    end
  end
end

Liquid::Template.register_tag('ahfowaudio', Jekyll::AhfowAudioTag)