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
# AHFoW liquid ahfowbc
#
# Example:
#    {% ahfowbc "bandcamp-url" "bandcamp-caption" %}

module Jekyll
  class AhfowBcTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        ahfowbc_url, ahfowbc_caption, ahfowbc_thumbnail, page_url = tag_contents[0], tag_contents[1], tag_contents[2], context['page']['url']
        ahfowbc_tag(ahfowbc_url, ahfowbc_caption, ahfowbc_thumbnail,page_url)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'ahfowbc' while parsing the following markup:

  #{@markup}

Valid syntax:
{% ahfowbc video-url video-caption %}
eos
      end
    end

    private


    def determine_arguments(input)
      matched = input.match(/"(.*?)" ?"(.*?)"( ?"(.*?)")?/)
      [matched[1].to_s.strip, matched[2].to_s.strip, matched[4].to_s.strip] if matched && matched.length >= 3
    end

    def ahfowbc_tag(ahfowbc_url, ahfowbc_caption = nil, ahfowbc_thumbnail = nil, page_url=nil)
      if ahfowbc_thumbnail.empty?
        ahfowbc_thumbnail = "https://img.youtube.com/vi/#{ahfowbc_url}/maxres1.jpg"
      end
      <<~HEREDOC
      <div class="text-center">
        <figure class="figure w-100">
          <a 
             data-goatcounter-click="external-bandcamp.com-#{ahfowbc_url}"
             data-goatcounter-title="Bandcamp-#{ahfowbc_caption}"
             data-goatcounter-referrer="#{page_url}"
             href="{ahfowbc_url}" >
              <img src="#{ahfowbc_thumbnail}" class="img-fluid opacity-3h4 mx-auto" />
          <figcaption class="figure-caption text-right">
            #{ahfowbc_caption} (play on Bandcamp)
          </figcaption>
          </a>
        </figure>
      </div>
      HEREDOC
#      "<figure class=\"figure embed-responsive\">\<a href=\"https://www.youtube.com/watch?v=#{ahfowbc_url}\">    <div class=\"ytimg\">     <i class=\"bi bi-play-btn-fill display-3 text-danger text-center\"></i><img src=\"https://img.youtube.com/vi/#{ahfowbc_url}/maxres1.jpg\" width=\"640\" height=\"480\" class=\"img-fluid rounded mx-auto d-block\" alt=\"#{ahfowbc_caption} (link to youtube)\">   </div>  </a>  <figcaption class=\"figure-caption text-right\">#{ahfowbc_caption} (link to youtube)</figcaption></figure>"
#      if ahfowbc_caption.empty?
#        "<figure class=\"figure embed-responsive embed-responsive-16by9\"><iframe class=\"embed-responsive-item\" width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/#{ahfowbc_url}\" frameborder=\"0\" allowfullscreen></iframe></figure>"
#      else
#        "<figure class=\"figure embed-responsive embed-responsive-16by9\"><iframe class=\"embed-responsive-item\" width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/#{ahfowbc_url}\" frameborder=\"0\" allowfullscreen></iframe><figcaption class=\"figure-caption text-right\">#{ahfowbc_caption}</figcaption></figure>"
#      end
    end
  end
end

Liquid::Template.register_tag('ahfowbc', Jekyll::AhfowBcTag)
