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
  require 'json'
  class AhfowAudio2Tag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
        @input = input
      end

      def render(context)
        # Attempt to parse the JSON if any is passed in
        begin
          if( !@input.nil? && !@input.empty? )
            jdata = JSON.parse(@input)
          if( jdata.key?( "audiourl" ) )
            ahfowaudio_url = jdata["audiourl"].strip
          end
          if( jdata.key?( "audiocap" ) )
            ahfowaudio_caption = jdata["audiocap"].strip
          end
          if( jdata.key?( "sourceurl" ) )
            ahfowaudio_sourceurl = jdata["sourceurl"].strip
          end
          if( jdata.key?( "sourcecap" ) )
            ahfowaudio_sourcecap = jdata["sourcecap"].strip
          end
        end
        rescue
      end

      output = "<div class=\"well\">"
      output += "<p class=\"audio\">Audio: <a href=\"#{ahfowaudio_url}\">#{ahfowaudio_caption}</a></p>"
      output += "<audio controls=\"controls\" preload=\"none\" src=\"#{ahfowaudio_url}\"></audio>"

      if( !ahfowaudio_sourceurl.nil? && !ahfowaudio_sourceurl.empty? )
        output += "<p class=\"source small text-right\"><em>Source: <a href=\"#{ahfowaudio_sourceurl}\">#{ahfowaudio_sourcecap}</a></em></p>"
      end

      output += "</div>"
      return output
    end
  end
end

Liquid::Template.register_tag('ahfowaudio2', Jekyll::AhfowAudio2Tag)