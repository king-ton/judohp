class ApplicationPolicy
  attr_reader :user, :record
  def initialize(user, record)
    @user = user
    @record = record
  end

  # Gibt Aktivitäten eines Nutzers zurück
  def user_activities
    @user.roles.select(:activities).distinct.map(&:activities).flatten
  end
  
  # Definiert Format einer Aktivität
  def inferred_activity(method)
    "#{@record.class.model_name.singular}:#{method.to_s}"
  end

  # Methode für Record nicht vorhanden
  def method_missing(name,*args)
    if name.to_s.last == '?'
      if user != nil
        user_activities.include?(inferred_activity(name.to_s.gsub('?','')))
      else
        false
      end
    else
    super
    end
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def create?
    new?
  end
  def update?
    edit?
  end
  def destroy?
    delete?
  end
end

