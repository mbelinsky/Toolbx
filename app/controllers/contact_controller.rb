#!/bin/env ruby
# encoding: utf-8
class ContactController < ApplicationController
  def new
    @title = "» Contact"
    @contact_message = ContactMessage.new
    @has_footer = true
  end

  def create
    @title = "» Contact"
    @contact_message = ContactMessage.new(params[:contact_message])
    @has_footer = true

    if @contact_message.valid?
      ContactMailer.new_message(@contact_message).deliver
      redirect_to :back, notice: 'Thanks! We\'ll be in touch soon.'
    else
      render :new
    end
  end
end