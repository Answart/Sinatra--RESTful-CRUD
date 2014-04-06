get '/' do
  # Look in app/views/index.erb
  @notes = Note.all
  erb :index
end


post '/notes/new' do
  Note.create(params)
  redirect '/'
end



# SHOW EDITING FORM FOR NOTE IN :edit_note
get '/notes/:note_id/edit' do
  @note = Note.find(params[:note_id])
  erb :edit_note
end
# RECEIVE UPDATED POST attributes FROM EDIT FORM PAGE TO UPDATE NEW POST. REDIRECTED TO UPDATED POST
put '/notes/:note_id' do
  @note = Note.find(params[:note_id])
  @note.update_attributes(
    title: params[:title],
    message: params[:message]
    )
  @note.save
  redirect '/'
end




# RECEIVE FORM TO ASK CONFIRMATION ABOUT note DELETION
# get "/notes/:note_id/delete" do
#   @note = Note.find(params[:note_id])
#   erb :delete_note
# end
# DESTROY note
get "/notes/:note_id/delete" do
  @note = Note.find(params[:note_id])
  @note.destroy
  redirect "/"
end
