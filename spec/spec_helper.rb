APP_PATH = Pathname.new File.expand_path(File.join(File.dirname(__FILE__), '..'))

Dir[APP_PATH + "lib" + "**" + "*.rb"].each { |files| require files }




