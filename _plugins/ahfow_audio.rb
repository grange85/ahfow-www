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
  require 'uri'
  class AhfowAudioTag < Liquid::Tag
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
        audiouri = URI.parse(ahfowaudio_url).path
      output = "<div class=\"card mb-2\"><div class=\"card-body\">"
      output += "<p class=\"audio\"><i class=\"bi bi-file-music\"> </i><a href=\"#{ahfowaudio_url}\" download=\"download-from-ahfow\" data-goatcounter-click=\"#{ahfowaudio_url}\" data-goatcounter-title=\"download-audio: #{ahfowaudio_caption}\" data-goatcounter-referrer=\"#{context['page']['url']}\">#{ahfowaudio_caption}</a></p>"
      output += "<audio class=\"w-100\" controls=\"controls\" preload=\"none\" src=\"#{ahfowaudio_url}\" onplay=\"window.goatcounter.count({path: '#{ahfowaudio_url}',title: 'play-audio: #{ahfowaudio_caption}', event: true,});\"></audio></div>"
      if( !ahfowaudio_sourceurl.nil? && !ahfowaudio_sourceurl.empty? )
        output += "<p class=\"card-footer text-right pt-2 pb-1 \"><small class=\"text-muted\">Source: <a href=\"#{ahfowaudio_sourceurl}\">#{ahfowaudio_sourcecap}</a></small></p>"
      end

      output += "</div>"
      return output
    end
  end
end

Liquid::Template.register_tag('ahfowaudio', Jekyll::AhfowAudioTag)
