
class Bashy_File

  module Base

    include Get_Set::DSL
    attr_get_set :path, :content, :mode, :user_and_group
    
    def initialize *args
      super
      package(:create) { run cmd_create }
      package(:append) { run cmd_append }
    end

    def sudo *args, &blok
      return(@sudo ? 'sudo' : nil) if args.empty? && !block_given?
      super
    end # === sudo

    def cmd_sudo
      sudo ? 'sudo' : nil
    end

    def cmd_create_file
      return nil unless action == :create
      cmd %@ echo #{content} > #{cmd_sudo} tee #{path} @
    end # === cmd_write_file

    def cmd_append
      return nil unless action == :append
      cmd %@ echo #{content} >> #{cmd_sudo} tee #{path}@
    end

    def cmd_chmod_file
      sudo = self.sudo || ''
      mod  = self.mode.to_s.strip

      return nil if mod.empty?
      "#{sudo} chmod #{mod} #{path}"
    end

    def cmd_chown_file
      owner = [user_and_group, user_and_group].compact.map(&:to_s).map(&:strip).reject(&:empty?).join(':')

      return nil if owner.empty?
      "#{sudo} chmod #{owner} #{path}"
    end # === cmd_chown_file

    def cmd cmd
      [ 
        cmd,
        cmd_chmod_file, 
        cmd_chown_file 
      ].compact.join(" && ")
    end
    
  end # === Base
  
  include Base
  
end # === Bashy_File
