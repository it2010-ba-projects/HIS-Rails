# -*- encoding: utf-8 -*-
module FormHelper
  # in ApplicationHelper, include BootstrapFormBuilder::FormHelper
  def bootstrap_form_for(object, options = {}, &block)
    options[:builder] = BootstrapFormBuilder
    options[:html] ||= {}
    
    form_type = options.delete :type
    css_class = options[:html].delete :class
    form_css = "form-#{form_type.present? ? form_type : 'horizontal' }"
    
    options[:html][:class] = "#{form_css}"
    options[:html][:class] << " #{css_class}" if css_class.present?
    
    BootstrapFormBuilder.with_custom_field_error_proc do
      form_for(object, options, &block)
    end
  end
  
  def delete_button instance, options = {}
    options[:size] ||= :mini
    css_class = "btn btn-danger"
    css_class << "  btn-#{options[:size]}" unless options[:size] == :normal   
    link_to instance, method: :delete, data: { confirm: 'Sind Sie sicher?' }, class: css_class do
      add_icon("trash", inverse: true) +
      "Löschen"
    end
  end
  
  def edit_button path, options = {}
    options[:title] ||= "Bearbeiten"
    link_to path, class: "btn btn-mini btn-primary" do
      add_icon("edit", inverse: true) + 
      options[:title]
    end
  end
  
  def cancel_button instance, options = {}
    link_to instance, class: "btn btn-inverse" do
      add_icon("remove-circle", inverse: true) + 
      "Abbrechen"
    end
  end
  
  def show_button instance, options = {}
    options[:title] ||= "Anzeigen"
    link_to instance, class: "btn btn-mini btn-info" do
      add_icon("info-sign", inverse: true) +
      options[:title]
    end
  end
  
  def submit_button form, options = {}
    value = " #{submit_default_value form.object.to_model}"
    button_tag type: :submit, class: "btn btn-primary" do      
      add_icon("ok", inverse: true) +
      value
    end
  end
  
  def create_link path, model, options = {}
    add_icon("plus-sign") <<
    link_to(path) do
      "#{I18n.t(:create, scope: [:helpers, :submit], model: model)}"
    end
  end
  
  def list_link path, options = {}    
    add_icon("list") <<
    link_to(path) do
      "Zurück zur Auflistung"
    end
  end
  
  def add_icon icon_class, options = {}
    css_class = "icon-#{icon_class}"
    css_class << " icon-white" if options[:inverse]
    "#{content_tag(:i, "", class: css_class)}\n&nbsp;".html_safe
  end
  
  def add_button caption, path, options = {}
    icon_class = options.delete :icon
    button_size = options.delete :size
    button_type = options.delete :type
    btn_css_class = "btn"
    btn_css_class << " btn-#{button_type}" if button_type.present?
    btn_css_class << " btn-#{button_size}" if button_size.present?
    
    link_to path, class: btn_css_class do
      if icon_class.present?
        add_icon(icon_class, options)      
      end +
      caption
    end
  end
    
  private
  def submit_default_value object
    key    = object ? (object.persisted? ? :update : :create) : :submit

    model = object.class.model_name.human
    object_name = object.class.model_name.downcase

    defaults = []
    defaults << :"helpers.submit.#{object_name}.#{key}"
    defaults << :"helpers.submit.#{key}"
    defaults << "#{key.to_s.humanize} #{model}"

    I18n.t(defaults.shift, :model => model, :default => defaults)
  end  
end