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
# AHFoW liquid ahfowvideo
#
# Example:
#    {% ahfowvideo "video-url" "video-caption" %}

module Jekyll
  class AhfowVideoTag < Liquid::Tag

    def render(context)
      if tag_contents = determine_arguments(@markup.strip)
        ahfowvideo_url, ahfowvideo_caption, ahfowvideo_thumbnail, page_url = tag_contents[0], tag_contents[1], tag_contents[2], context['page']['url']
        ahfowvideo_tag(ahfowvideo_url, ahfowvideo_caption, ahfowvideo_thumbnail,page_url)
      else
        raise ArgumentError.new <<-eos
Syntax error in tag 'ahfowvideo' while parsing the following markup:

  #{@markup}

Valid syntax:
{% ahfowvideo video-url video-caption %}
eos
      end
    end

    private


    def determine_arguments(input)
      matched = input.match(/"(.*?)" ?"(.*?)"( ?"(.*?)")?/)
      [matched[1].to_s.strip, matched[2].to_s.strip, matched[4].to_s.strip] if matched && matched.length >= 3
    end

    def ahfowvideo_tag(ahfowvideo_url, ahfowvideo_caption = nil, ahfowvideo_thumbnail = nil, page_url=nil)
      if ahfowvideo_thumbnail.empty?
        ahfowvideo_thumbnail = "https://img.youtube.com/vi/#{ahfowvideo_url}/maxres1.jpg"
      end
      <<~HEREDOC
      <div class="text-center">
        <figure class="figure w-100">
          <a 
             data-goatcounter-click="external-youtube.com-#{ahfowvideo_url}"
             data-goatcounter-title="YouTube-#{ahfowvideo_caption}"
             data-goatcounter-referrer="#{page_url}"
             href="https://www.youtube.com/watch?v=#{ahfowvideo_url}" >
              <img src="#{ahfowvideo_thumbnail}" class="img-fluid opacity-3h4 mx-auto" />
          <figcaption class="figure-caption text-right">
            #{ahfowvideo_caption} (play on YouTube)
          </figcaption>
          </a>
        </figure>
      </div>
      HEREDOC
#      "<figure class=\"figure embed-responsive\">\<a href=\"https://www.youtube.com/watch?v=#{ahfowvideo_url}\">    <div class=\"ytimg\">     <i class=\"bi bi-play-btn-fill display-3 text-danger text-center\"></i><img src=\"https://img.youtube.com/vi/#{ahfowvideo_url}/maxres1.jpg\" width=\"640\" height=\"480\" class=\"img-fluid rounded mx-auto d-block\" alt=\"#{ahfowvideo_caption} (link to youtube)\">   </div>  </a>  <figcaption class=\"figure-caption text-right\">#{ahfowvideo_caption} (link to youtube)</figcaption></figure>"
#      if ahfowvideo_caption.empty?
#        "<figure class=\"figure embed-responsive embed-responsive-16by9\"><iframe class=\"embed-responsive-item\" width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/#{ahfowvideo_url}\" frameborder=\"0\" allowfullscreen></iframe></figure>"
#      else
#        "<figure class=\"figure embed-responsive embed-responsive-16by9\"><iframe class=\"embed-responsive-item\" width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/#{ahfowvideo_url}\" frameborder=\"0\" allowfullscreen></iframe><figcaption class=\"figure-caption text-right\">#{ahfowvideo_caption}</figcaption></figure>"
#      end
    end
  end
end

Liquid::Template.register_tag('ahfowvideo', Jekyll::AhfowVideoTag)
