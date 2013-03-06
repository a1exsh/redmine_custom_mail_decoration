module RedmineCustomMailDecoration
  module MailerPatch
    unloadable

    def self.included(base)
      base.class_eval do
        alias_method_chain :issue_edit, :custom_mail_decoration
      end
    end

    def issue_edit_with_custom_mail_decoration(*args)
      @emails_header = ''
      issue_edit_without_custom_mail_decoration(*args)
    end
  end
end
