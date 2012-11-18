# -*- encoding: utf-8 -*-
module MenuHelper
    
  def render_navigation_items
    nav = ""
    nav_items = []
    if (user_signed_in?)
      nav_items << { name: "Übersicht", url: root_path }
      nav_items << { name: "Abmelden", url: destroy_user_session_path, method: :delete, divider: true }
    else
      nav_items << { name: "Anmelden", url: new_session_path(User)}
    end
    nav_items.each do |item|
      
      if item[:divider].present?
        nav << content_tag(:li, "", class: "divider")
      end
      
      nav << content_tag(:li) do
        link_to(item[:url], method: item[:method]) do
          link = ""
          link << content_tag(:i, "", class: item[:icon]) unless item[:icon].blank?          
          link << item[:name]
          link.html_safe
        end
      end
    end
    nav.html_safe
  end
  
end