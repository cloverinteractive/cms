require 'fileutils'

class Wymeditor
  WYMEDITOR_PATH      = File.join Rails.root, 'vendor', 'wymeditor'
  WYMEDITOR_SRC_PATH  = File.join WYMEDITOR_PATH, 'src', 'wymeditor'
  BUILD_PATH          = File.join WYMEDITOR_PATH, 'build', 'build'
  DESTINATION_PATH    = File.join Rails.root, 'public', 'javascripts', 'wymeditor'

  def self.compile_editor
    command = "cd #{WYMEDITOR_PATH} && make"
    system command
  end

  def self.move_compiled_editor
    FileUtils.mkdir DESTINATION_PATH if !File.exist? DESTINATION_PATH

    FileUtils.cp   Dir.glob( File.join BUILD_PATH, '*' ), DESTINATION_PATH
    FileUtils.rm_r BUILD_PATH, :force => true
  end

  def self.copy_editor_assets
    %w(iframe lang plugins skins).each do |asset|
      FileUtils.cp_r File.join( WYMEDITOR_SRC_PATH, asset ), DESTINATION_PATH
    end
  end
end
