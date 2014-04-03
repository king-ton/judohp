module ApplicationHelper
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
  
  def link_to_add_fields(f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(raw("<span class='glyphicon glyphicon-plus green pull-right'></span>"), '#', onclick: h("add_fields(\"#{association}\", \"#{escape_javascript(fields)}\"); return false") )
  end
  
  def link_to_remove_fields(f)
    f.hidden_field(:_destroy) + link_to(raw("<span class='glyphicon glyphicon-minus red'></span>"), '#', onclick: "remove_fields(this); return false" )
  end
end
