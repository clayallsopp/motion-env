module Motion; module Project;
  class Builder
    MARSHAL_SIGIL = "__marshall__"
    NULL = "\x00"
    NULL_REPLACEMENT = "\\x00"

    def build_with_env(config, platform, opts)
      config_env = config.env
      File.open(config_env.file_path, 'w') { |f|
        f.write %Q{
ENV.instance_variable_set("@get_key_without_patch", ENV.method(:[]))
ENV.instance_eval do
  def [](key)
    value = @get_key_without_patch.call(key)
    if value && value.start_with?("#{MARSHAL_SIGIL}")
      value = Marshal.load(value.gsub("#{MARSHAL_SIGIL}", "").gsub('#{NULL_REPLACEMENT}', '#{NULL}'))
    end
    value
  end
end
}
        config_env.each do |key, value|
          dump_value = value
          if !value.is_a?(String)
            dump_value = MARSHAL_SIGIL + Marshal.dump(value).gsub(NULL, NULL_REPLACEMENT)
          end
          f.write "ENV['#{key.to_s}'] = '#{dump_value}'\n"
        end
      }
      config.files << config_env.file_path

      build_without_env(config, platform, opts)
    end

    alias_method "build_without_env", "build"
    alias_method "build", "build_with_env"
  end
end; end