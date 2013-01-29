#!/bin/env ruby
# encoding: utf-8
class AboutController < ApplicationController
  def index
    @title = "» About"
    @has_footer = true
    @toolbar_docked = true
  end
end