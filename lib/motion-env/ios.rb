module Motion; module Project;
  class XcodeConfig
    variable :env

    class EnvWrapper < Hash
      attr_accessor :timestamp

      def initialize(*args)
        super
        @timestamp = Time.now.to_i
      end

      def file_path
        @file_path ||= "/tmp/motion_env_#{@timestamp}.rb"
      end
    end

    def env
      @env ||= EnvWrapper.new
    end

    alias_method :ENV, :env
  end
end; end