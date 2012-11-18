class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def control_group(method, *args, &block)
    options = args.extract_options!    
    error_class = object.errors[method].present? ? 'error' : ''
    label_text = label(method, options[:label], class: 'control-label') unless options[:no_label]
    @template.field_set_tag(options[:legend], class: ['control-group', error_class].join(' '), id: "#{object.class.to_s.downcase}_#{method}_control_group") do
      label_text.to_s.html_safe +
      @template.content_tag(:div, class: 'controls') do
        doc = Nokogiri::HTML::DocumentFragment.parse(@template.capture(&block))
        if help_block = doc.at_css('.help-block')
          help_block.before inline_errors(method)
        else
          doc.add_child inline_errors(method)
        end
        doc.to_html.html_safe
      end
    end
  end
  
  def submit(value = nil, options= {})
    icon_class = options.delete :icon
    icon_class ||= "ok"
        
    value ||= submit_default_value
    unless options[:no_icon]
      value = @template.add_icon(icon_class, inverse: true) << value      
    end
    
    @template.button_tag type: :submit, class: "btn btn-primary" do
      value
    end
  end

  private

  def inline_errors(method)
    if object.errors[method].present?
      @template.content_tag :span, object.errors[method].to_sentence, class: 'help-inline'
    else
      ''
    end
  end

  def self.with_custom_field_error_proc(&block)
    default_field_error_proc = ::ActionView::Base.field_error_proc
    ::ActionView::Base.field_error_proc = ->(html_tag, instance) { html_tag }
    yield
  ensure
    ::ActionView::Base.field_error_proc = default_field_error_proc
  end
end

