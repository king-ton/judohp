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
      render(f.object.class.to_s.downcase.pluralize + "/" + association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(raw("<span class='glyphicon glyphicon-plus green pull-right'></span>"), '#', onclick: h("add_fields(\"#{association}\", \"#{escape_javascript(fields)}\"); return false") )
  end

  def link_to_remove_fields(f)
    f.hidden_field(:_destroy) + link_to(raw("<span class='glyphicon glyphicon-minus red'></span>"), '#', onclick: "remove_fields(this); return false" )
  end

  def link_to_index(model, a={:text => false, :wrap => nil})
    a[:allow] = policy(Object.const_get(model.singularize.capitalize).new).index? if a[:allow] == nil
    if a[:allow]
      link = link_to(raw("<span class='glyphicon glyphicon-th'></span> #{(a[:text] ? t('views.index') : '')}"), send(model + "_path"))
      if a[:wrap] != nil
        content_tag(a[:wrap], link)
      else
      link
      end
    end
  end

  def link_to_show(model, a={:text => false, :wrap => nil})
    a[:allow] = policy(model).show? if a[:allow] == nil
    if a[:allow]
      link = link_to raw("<span class='glyphicon glyphicon-th-list'></span> #{(a[:text] ? t('views.show') : '')}"), model
      if a[:wrap] != nil
        content_tag(a[:wrap], link)
      else
      link
      end
    end
  end

  def link_to_new(model, a={:text => false, :wrap => nil})
    a[:allow] = policy(Object.const_get(model.singularize.capitalize).new).new? if a[:allow] == nil
    if a[:allow]
      link = link_to(raw("<span class='glyphicon glyphicon-plus'></span> #{(a[:text] ? t('views.' + model.singularize + '.new.action') : '')}"), send("new_" + model.singularize + "_path"))
      if a[:wrap] != nil
        content_tag(a[:wrap], link)
      else
      link
      end
    end
  end

  def link_to_edit(model, a={:text => false, :wrap => nil})
    a[:allow] = policy(model).edit? if a[:allow] == nil
    if a[:allow]
      link = link_to(raw("<span class='glyphicon glyphicon-pencil'></span> #{(a[:text] ? t('views.edit') : '')}"), send("edit_" + model.class.to_s.downcase + "_path", model))
      if a[:wrap] != nil
        content_tag(a[:wrap], link)
      else
      link
      end
    end
  end

  def link_to_delete(model, a={:text => false, :wrap => nil})
    a[:allow] = policy(model).delete? if a[:allow] == nil
    if a[:allow]
      link = link_to(raw("<span class='glyphicon glyphicon-trash'></span> #{(a[:text] ? t('views.destroy') : '')}"), send(model.class.to_s.downcase + "_delete_path", model), remote: true)
      if a[:wrap] != nil
        content_tag(a[:wrap], link)
      else
      link
      end
    end
  end

  def sidebar
    if controller?("users", "roles")
      if policy(User.new).index? || policy(Role.new).index?
        "user"
      end
    elsif controller?("members", "people")
      if policy(Member.new).index? || policy(Person.new).index?
        "member"
      end
    elsif controller?("venues", "competition_templates", "competitions", "age_classes")
      if policy(Venue.new).index? || policy(CompetitionTemplate.new) || policy(Competition.new) || policy(AgeClass.new)
        "competition"
      end
    end
  end
end
