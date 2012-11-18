# -*- encoding: utf-8 -*-
module ApplicationHelper
include MenuHelper
include FormHelper

  def title(page_title, options = {})
    content_for :title, page_title.to_s
    options[:title_tag] ||= :h2
    header_content = page_title.to_s
    
    if options[:additional_info]
      header_content << "<br />"
      header_content << options[:additional_info].gsub("\n", "<br />")
    end
    
    content_tag :div, class: "page-header" do
      content_tag options[:title_tag] do
        header_content.html_safe
      end
    end
  end
  
  def flash_message 
    messages = ""
    
    flash.each {|type, msg|
      if msg.present?
        flash_class = "alert"

        case type
        when :notice
          flash_class << " alert-success"
        when :alert
          flash_class << " alert-error"
        else
          flash_class << " alert-#{type}"
        end
        
        messages << content_tag(:div, :class => "#{flash_class}") do
          content_tag(:a, "&times;".html_safe, :class => "close", "data-dismiss" => "alert") <<
          msg
        end
      end
    }
    messages.html_safe    
  end
  
  def error_messages_for(*params)
    options = params.extract_options!.symbolize_keys

    if object = options.delete(:object)
      objects = Array.wrap(object)
    else
      objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
    end

    count  = objects.inject(0) {|sum, obj| sum + obj.errors.count }
    unless count.zero?
      html = {}
      if options.include?(:id)
        value = options[:id]
        html[:id] = value unless value.blank?
      else
        html[:id] = 'errorExplanation'
      end
      
      if options.include?(:class)
        value = options[:class]
        html[:class] = "#{value unless value.blank?} alert alert-info"
      else
        html[:class] = 'alert alert-error'
      end
      
      options[:object_name] ||= params.first

      I18n.with_options :locale => options[:locale], :scope => [:activerecord, :errors, :template] do |locale|
        header_message = if options.include?(:header_message)
          options[:header_message]
        else
          object_name = options[:object_name].to_s
          object_name = I18n.t(object_name, :default => object_name.gsub('_', ' '), :scope => [:activerecord, :models], :count => 1)
          locale.t :header, :count => count, :model => object_name
        end
        message = options.include?(:message) ? options[:message] : locale.t(:body)
        error_messages = objects.sum {|obj| obj.errors.full_messages.map {|msg| content_tag(:li, ERB::Util.html_escape(msg)) } }.join.html_safe

        contents = ''
        contents << content_tag(:a, "&times;".html_safe, :class => "close", "data-dismiss" => "alert")
        contents << content_tag(options[:header_tag] || :h2, ERB::Util.html_escape(header_message), :class => "alert-heading") unless header_message.blank?
        contents << content_tag(:p, ERB::Util.html_escape(message)) unless message.blank?
        contents << content_tag(:ul, error_messages)

        content_tag(:div, contents.html_safe, html)
      end
    else
      ''
    end
  end
end

