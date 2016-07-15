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
  class AhfowBandcampTag < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
        @input = input
      end

      def render(context)
        # Attempt to parse the JSON if any is passed in
        begin
          if( !@input.nil? && !@input.empty? )
            jdata = JSON.parse(@input)
            if( jdata.key?( "type" ) )
              type = jdata["type"].strip
            end
            if( jdata.key?( "album" ) )
              album_id = jdata["album"].strip
              height = "120"
              size = "large"
              tracklist = "false"
              artwork = "small"
              track_id = ""
            elsif ( jdata.key?( "track" ) )
              track_id = jdata["track"].strip
              album_id = ""
              height = "42"
              size = "small"
              tracklist = "false"
              artwork = "false"
            else return ""
          end
        end
        rescue
      end
#      format = "%s - %s - %s - %s - %s - %s"
      format = '<iframe class="embed-responsive-item" style="border: 0; width: 100%%; height: %spx;" src="https://bandcamp.com/EmbeddedPlayer/album=%s/size=%s/bgcol=333333/linkcol=0f91ff/tracklist=%s/artwork=%s/track=%s/transparent=true/" seamless></iframe>'
      output = sprintf(format, height, album_id, size, tracklist, artwork, track_id)
      return output
    end
  end
end

Liquid::Template.register_tag('bandcamp', Jekyll::AhfowBandcampTag)