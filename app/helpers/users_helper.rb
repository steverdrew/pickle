module UsersHelper
  def is_owner(user)
    is_owner = user.is_owner
    logger.info "**************"
    logger.info user.is_owner
    logger.info "**************"
    if is_owner.nil?
      is_owner = false
    end
    return is_owner
  end
  
  def name(user)
    name = user.first_name
    if name.nil?
      name = user.name
    end
    return name
  end
    
end
