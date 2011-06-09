module I18n
  module Backend
    module Base

      def load_yml(filename)
        puts "i18n: loading YAML file #{filename.inspect}"
        YAML.load_file(filename)
      end

    end
  end
end

