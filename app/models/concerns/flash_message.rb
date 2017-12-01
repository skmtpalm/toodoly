module FlashMessage
  extend ActiveSupport::Concern
  #
  # For example A, (model_name).flash_success(:create) => "task creat!"
  # For example B, (model_name).flash_error(:create) => "Error task"
  # @param state [Symbol]
  #
  %w(success error).each do |message_type|
    define_method("flash_#{message_type}") do |state|
      I18n.t("flash.#{message_type}.#{state}", model: self.class.model_name.human)
    end
  end
end
