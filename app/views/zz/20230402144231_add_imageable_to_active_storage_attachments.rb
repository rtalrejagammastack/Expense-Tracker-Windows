class AddImageableToActiveStorageAttachments < ActiveRecord::Migration[6.1]
  def change
    add_reference :active_storage_attachments, :imageable, polymorphic: true, null: false
    rename_column :active_storage_attachments, :record_id, :imageable_id
    rename_column :active_storage_attachments, :record_type, :imageable_type
  end
end


<% @post.images.each do |image| %>
  <%= image_tag url_for(image) %>
<% end %>