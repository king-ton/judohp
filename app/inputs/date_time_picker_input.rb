class DateTimePickerInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: 'input-group date ' + (options.has_key?(:class) ? options[:class] : 'test')) do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_table
    end
  end

  def input_html_options
    {class: 'form-control',:value => (I18n.l(@builder.object.send(attribute_name)) if @builder.object.send(attribute_name))}
  end

  def span_table
    template.content_tag(:span, class: 'input-group-addon') do
      template.concat icon_table
    end
  end

  def icon_table
    "<i class='glyphicon glyphicon-calendar'></i>".html_safe
  end

end