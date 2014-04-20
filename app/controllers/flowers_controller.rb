# coding: utf-8

class FlowersController < ApplicationController
  require 'mechanize'

  def show
    t = Time.now

    agent = Mechanize.new
    page = agent.get("http://www.birthdaycolors.jp/h/b/f/#{t.strftime("%m%d")}/")
    name = page.title.match(/「(.*)」/)[1]

    @body = {name: name, time: t}
    render json: @body
  end
end
