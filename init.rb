require 'redmine'

Redmine::Plugin.register :redmine_custom_mail_decoration do
  name ''
  author 'Alex Shulgin <ash@commandprompt.com>'
  description ''
  version '0.1.0'
#  url 'http://example.com/path/to/plugin'
#  author_url 'http://example.com/about'
end

prepare_block = Proc.new do
  Mailer.send(:include, RedmineCustomMailDecoration::MailerPatch)
end

if Rails.env.development?
  ActionDispatch::Reloader.to_prepare { prepare_block.call }
else
  prepare_block.call
end
