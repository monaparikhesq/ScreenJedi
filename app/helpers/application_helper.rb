module ApplicationHelper

def video_embed_tag(link)
    domain = link.split('/')[2]
    
    if domain.include?("youtube")
      
      query_string = link.split("?").last
      if query_string
        parameters = query_string.split("&")
        if parameters
          id_param = parameters.select { |parameter| parameter[0..1] == "v=" }.first
          if id_param
            id = id_param.split("=").last
          end
        end
      end
      
      return "<iframe width='426.5' 
                      height='252.5' 
                      src='http://www.youtube.com/embed/#{id}' 
                      frameborder='0' 
                      allowfullscreen>
              </iframe>"
              
    elsif domain.include?("youtu.be")
      
      id = link.split('/').last
      
      return "<iframe width='426.5' 
                      height='252.5'
                      src='http://www.youtube.com/embed/#{id}' 
                      frameborder='0' 
                      allowfullscreen>
              </iframe>"
              
    elsif domain.include?("vimeo")
      
      id = link.split('/').last
      
      return "<iframe src='http://player.vimeo.com/video/#{id}?title=1&amp;byline=0&amp;portrait=0'
                      width='853' 
                      height='505' 
                      frameborder='0' 
                      webkitAllowFullScreen 
                      mozallowfullscreen 
                      allowFullScreen>
              </iframe>"
              
    elsif domain.include?("facebook")
      
      id = link.split('=').last
    
      return "<object width='853' height='505' >
                <param name='allowfullscreen' value='true' />
                <param name='movie' value='http://www.facebook.com/v/#{id}' />
                <embed src='http://www.facebook.com/v/#{id}' 
                       type='application/x-shockwave-flash' 
                      allowfullscreen='true' 
                      width='853' 
                      height='505'>
                </embed>
              </object>"
              
    elsif domain.include?("nbc.com")
      
      id = link.split('/').last
      
      return "<iframe id='NBC Video Widget' 
                      width='853' height='505' 
                      src='http://www.nbc.com/assets/video/widget/widget.html?vid=#{id}' 
                      frameborder='0'>
              </iframe>"
                  
    else
      
      return "<p>Sorry, we aren't able to embed videos from #{domain} just yet.</p>
              <p><a href='#{link}' target='_blank'>Click here</a> to go directly to the video.</p>"
    end
  end
  
  def pdf_embed_tag(url)
    
    return "<embed type='application/pdf' width='300px' height='200px' src=#{url} ></embed>"
    
  end

  def screencast_item
    image_tag('youtube-fill.png', border: 0)
  end

  def screencast_player
    image_tag('Screencast.png', border: 0)
  end 

end
