require File.join( Rails.root, 'lib', 'wymeditor' )

namespace :wymeditor do
  desc "it compiles wymeditor and it moves it to public/javascripts/wymeditor"
  task :compile do
    Wymeditor.compile_editor

    puts "Moving compiled files..."
    Wymeditor.move_compiled_editor
    puts "Moving editor assets..."
    Wymeditor.copy_editor_assets
  end
end

