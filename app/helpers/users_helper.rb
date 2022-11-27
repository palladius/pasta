module UsersHelper


=begin 
<% if user_signed_in? %>
    <p>Hi, <b><%= link_to current_user.to_s, edit_user_registration_path %></b></p>
        <%= link_to "Log out", destroy_user_session_path %>
<% else %>
    <p><i class="color:grey" >You're anonymous</i></p>
        <%= link_to "🚪Login", new_user_session_path, class: 'nav-link'%>
        <%= link_to "➕ SignUp", new_user_registration_path, class: 'nav-link' %>
<% end %>

=end
    def render_user_salutation_long(user=nil, html_class='')
        user = current_user() if user.nil?
        if user_signed_in?
            content_tag(
                :span, 
                ('Ciao, 🧑‍🦱' +  link_to(current_user.to_s, edit_user_registration_path)).html_safe,
                class: "#{html_class} user_loggedin"
            )
        else # anonymous
            content_tag(
                :i, 
                '👥 Anonymous',
                class: "#{html_class} user_anonymous"
            )
        end
    end

    def render_user_salutation_short()
        user_signed_in? ?
            "🧑‍🦱 #{current_user.to_s}" :
            '👥 Anonymous' 
    end


end