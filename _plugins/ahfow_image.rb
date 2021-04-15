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
# LFS liquid ahfowimage
#
# Example:
#    {% ahfowimage image-url image-caption %}

module Jekyll
  class AhfowImageTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        ahfowimage_url, ahfowimage_caption, ahfowimage_src = tag_contents[0], tag_contents[1], tag_contents[2]
        ahfowimage_tag(ahfowimage_url, ahfowimage_caption, ahfowimage_src)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'ahfowimage' while parsing the following markup:

  #{@markup}

Valid syntax:
{% ahfowimage image-url image-caption %}
eos
      end
    end

    private

    def determine_arguments(input)
      matched = input.match(/"(.*?)" ?"(.*?)"( ?"(.*?)")?/)
      [matched[1].to_s.strip, matched[2].to_s.strip, matched[4].to_s.strip] if matched && matched.length >= 3
    end

    def ahfowimage_tag(ahfowimage_url, ahfowimage_caption = nil, ahfowimage_src = nil)
      if ahfowimage_caption.empty?
        "<div class=\"text-center\"><figure class=\"figure\"><img src=\"#{ahfowimage_url}\" class=\"figure-image img-fluid rounded mx-auto d-block\" /></figure></div>"
      else
        ahfowimage_caption_b = ahfowimage_caption.gsub("(cc)", "<i class=\"fab fa-creative-commons\"></i>")
        ahfowimage_caption_b = ahfowimage_caption_b.gsub("(c)", "<i class=\"fas fa-copyright\"></i>")

        if ahfowimage_src.empty?
          "<div class=\"text-center\"><figure class=\"figure\"><img src=\"#{ahfowimage_url}\" class=\"figure-image img-fluid rounded mx-auto\" alt=\"#{ahfowimage_caption}\" /><figcaption class=\"figure-caption text-right\">#{ahfowimage_caption}</figcaption></figure></div>"
        else
          "<div class=\"text-center\"><figure class=\"figure\"><img src=\"#{ahfowimage_url}\" class=\"figure-image img-fluid rounded mx-auto\" alt=\"#{ahfowimage_caption}\" /><figcaption class=\"figure-caption text-right\"><a href=\"#{ahfowimage_src}\">#{ahfowimage_caption_b}</a></figcaption></figure></div>"
        end
      end
    end
  end
end

Liquid::Template.register_tag('ahfowimage', Jekyll::AhfowImageTag)