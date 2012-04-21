
class Bashy_File

  module Base

    include Get_Set::DSL
    attr_get_set :path, :content, :mode

    def create
      run cmd(%@ echo #{content.inspect} > #{sudo} tee #{path} @)
    end

    def append
      run cmd(%@ echo #{content.inspect} >> #{sudo} tee #{path}@)
    end

    def cmd_chmod_file
      sudo = self.sudo || ''
      mod  = self.mode.to_s.strip

      return nil if mod.empty?
      "#{sudo} chmod #{mod} #{path}"
    end

    def cmd_chown_file
      og = user_and_group
      return nil unless og
      "#{sudo} chown #{og} #{path}"
    end # === cmd_chown_file

    def cmd cmd
      [ 
        cmd,
        cmd_chmod_file, 
        cmd_chown_file 
      ].compact.join(" && ")
    end
    
  end # === Base
  
  include Bashy::Base
  include Base
  
end # === Bashy_File
