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
# AHFoW liquid aavid
#
# Example:
#    {% aavid video-url video-caption %}

module Jekyll
  class AaVidTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        aavid_url, aavid_caption = tag_contents[0], tag_contents[1]
        aavid_tag(aavid_url, aavid_caption)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'aavid' while parsing the following markup:

  #{@markup}

Valid syntax:
{% aavid video-url video-caption %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/["](.*?)["] ?["](.*?)["]/)
      [matched[1].to_s.strip, matched[2].to_s.strip] if matched && matched.length >= 3
    end

    def aavid_tag(aavid_url, aavid_caption = nil)
      if aavid_caption.empty?
        "<figure class=\"caption aligncenter\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/#{aavid_url}\" frameborder=\"0\" allowfullscreen></iframe></figure>"
      else
        "<figure class=\"caption aligncenter\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/#{aavid_url}\" frameborder=\"0\" allowfullscreen></iframe><figcaption class=\"caption-text\">#{aavid_caption}</figcaption></figure>"
      end
    end
  end
end

Liquid::Template.register_tag('aavid', Jekyll::AaVidTag)