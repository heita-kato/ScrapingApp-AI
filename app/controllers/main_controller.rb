require 'nokogiri'
require 'open-uri'

class MainController < ApplicationController
  @urlopenerror = 0

  def index
    @sites = Main.all
    @site = Main.new
  end

  def create
    @sites = Main.all
    @site = Main.new(main_params)

    begin
      html = URI.open(@site.url).read
    rescue StandardError, SocketError, OpenURI::HTTPError => e
      @urlopenerror = 1
    end

    if @urlopenerror==1
      render :index, status: :unprocessable_entity
      @urlopenerror = 0
    else 
      doc = Nokogiri::HTML.parse(html)
      @site.title = doc.title
      @site.body = doc.at_css('.body-text').text
      @site.time = doc.at_css('time').text

      if @site.save
        redirect_to @site
      else
        render :index, status: :unprocessable_entity
      end
    end
  end

  private
  
  def main_params
    params.require(:main).permit(:url)
  end
end
